import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './major.dart';

class MajorProvider with ChangeNotifier {
  List<Major> _items = [];
  Major currentMajor;
  List<String> _likedMajors;
  List<String> _maybeMajors;
  List<String> _dislikeMajors;
  //keys
  final String _likedKey = "liked_list";
  final String _maybeKey = "maybe_list";
  final String _dislikeKey = "dislike_list";
  //preferences
  SharedPreferences _prefs;
  //firebase
  final db = Firestore.instance;

  MajorProvider() {
    _loadUserData().then((_) {
      fetchItems().then((_) => updateCurrentMajor());
    });
  }

  Future<void> _loadUserData() async {
    _prefs = await SharedPreferences.getInstance();
    _likedMajors = _prefs.getStringList(_likedKey) ?? [];
    _maybeMajors = _prefs.getStringList(_maybeKey) ?? [];
    _dislikeMajors = _prefs.getStringList(_dislikeKey) ?? [];
  }

  void updateCurrentMajor() {
    currentMajor = _items.firstWhere((item) => item.status == MajorStatus.None,
        orElse: () => null);
    notifyListeners();
  }

  String fetchCurrentId() {
    return currentMajor != null ? currentMajor.id : null;
  }

  Major fetchMajorById(String id) {
    return id == null
        ? null
        : _items.firstWhere((item) => item.id == id, orElse: () => null);
  }

  void fireHandler() async {
    QuerySnapshot snapshot = await db.collection("MajorList").getDocuments();
    var documents = snapshot.documents;
    for (int i = 0; i < documents.length; i++) {
      _items.add(Major(
          base64Image: documents[i].data['base64Img'],
          description: documents[i].data['description'],
          videoUrl: documents[i].data['videoUrl'],
          id: documents[i].data['id']));
    }
  }

  Future<void> fetchItems() async {
    await fireHandler();

    for (int i = 0; i < _items.length; i++) {
      if (_likedMajors.contains(_items[i].id)) {
        _items[i].setLiked();
      } else if (_maybeMajors.contains(_items[i].id)) {
        _items[i].setMaybe();
      } else if (_dislikeMajors.contains(_items[i].id)) {
        _items[i].setDislike();
      }
    }
  }

  List<Major> get items {
    return [..._items];
  }

  List<Major> get likedMajors {
    return _items.where((item) => item.status == MajorStatus.Liked).toList();
  }

  List<Major> get dislikedMajors {
    return _items.where((item) => item.status == MajorStatus.Disliked).toList();
  }

  List<Major> get maybeMajors {
    return _items.where((item) => item.status == MajorStatus.Maybe).toList();
  }

  void setMajorLike(String id) {
    _saveLikedMajor(id);
    _items.firstWhere((item) => item.id == id).setLiked();
    notifyListeners();
  }

  void _saveLikedMajor(String id) async {
    if (!_likedMajors.contains(id)) {
      _likedMajors.add(id);
      await _prefs.setStringList(_likedKey, _likedMajors);
    }
  }

  void setMajorDislike(String id) {
    _saveDislikeMajor(id);
    _items.firstWhere((item) => item.id == id).setDislike();
    notifyListeners();
  }

  void _saveDislikeMajor(String id) async {
    if (!_dislikeMajors.contains(id)) {
      _dislikeMajors.add(id);
      await _prefs.setStringList(_dislikeKey, _dislikeMajors);
    }
  }

  void setMajorMaybe(String id) {
    _saveMaybeMajor(id);
    _items.firstWhere((item) => item.id == id).setMaybe();
    notifyListeners();
  }

  void _saveMaybeMajor(String id) async {
    if (!_maybeMajors.contains(id)) {
      _maybeMajors.add(id);
      await _prefs.setStringList(_maybeKey, _maybeMajors);
    }
  }

  void clearSelections() async {
    _likedMajors.removeWhere((_) => true == true);
    _dislikeMajors.removeWhere((_) => true == true);
    _maybeMajors.removeWhere((_) => true == true);

    print(_likedMajors);
    for (int i = 0; i < _items.length; i++) {
      _items[i].setNone();
    }
    await _prefs.setStringList(_likedKey, _likedMajors);
    await _prefs.setStringList(_maybeKey, _maybeMajors);
    await _prefs.setStringList(_dislikeKey, _dislikeMajors);
    updateCurrentMajor();
  }
}
