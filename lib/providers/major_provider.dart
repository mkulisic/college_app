import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  MajorProvider() {
    _loadUserData().then((_) {
      fetchItems();
      updateCurrentMajor();
    });
  }

  Future<void> _loadUserData() async {
    _prefs = await SharedPreferences.getInstance();
    _likedMajors = _prefs.getStringList(_likedKey) ?? [];
    _maybeMajors = _prefs.getStringList(_maybeKey) ?? [];
    _dislikeMajors = _prefs.getStringList(_dislikeKey) ?? [];
  }

  String _lorumIpsum = r"""
  <h1 dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Introduction:</span></h1>
<p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Electrical engineering is a very complex, but interesting major. It has many career opportunities and the earnings potential is really good. If you are interested in working with logic and electrical systems, this may be the perfect major for you.&nbsp;</span></p>
<p>
  <br>
</p>
<p>
  <br>
</p>
<h1 dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Skills &amp; Job description:</span></h1>
<ul style="margin-top:0;margin-bottom:0;">
  <li dir="ltr" style="list-style-type:disc;font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;">
    <h2 dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Skills:</span></h2>
    <ul style="margin-top:0;margin-bottom:0;">
      <li dir="ltr" style="list-style-type:disc;font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;">
        <p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Technical Skills</span></p>
      </li>
      <li dir="ltr" style="list-style-type:disc;font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;">
        <p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Innovation</span></p>
      </li>
      <li dir="ltr" style="list-style-type:disc;font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;">
        <p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Hard working</span></p>
      </li>
      <li dir="ltr" style="list-style-type:disc;font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;">
        <p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Teamwork skills</span></p>
      </li>
      <li dir="ltr" style="list-style-type:disc;font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;">
        <p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Capable of working under pressure</span></p>
      </li>
      <li dir="ltr" style="list-style-type:disc;font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;">
        <p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Aptitude for Math</span></p>
      </li>
    </ul>
  </li>
</ul>
<p>
  <br>
</p>
<ul style="margin-top:0;margin-bottom:0;">
  <li dir="ltr" style="list-style-type:disc;font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;">
    <h2 dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Job Description:</span></h2>
  </li>
</ul>
<p dir="ltr" style="line-height:1.38;text-indent: 36pt;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">An electrical engineer can do a wide variety of jobs. As the name suggests, electrical engineers deal with systems or products that operate using electricity. This ranges from large power systems like a city's electrical grid to small electronics, like a cellphone. Any job will require a deep understanding of both circuits and logic. Contrary to what many might believe, designing circuits is not the only important part of the job. Electrical engineers must be good at communicating ideas. This is crucial because most, if not all, projects will be completed with a team and all members must be on the same page. Electrical Engineers must also spent huge amounts of time testing new/already existing designs in order to make sure there will be no issues with them. Finally, electrical engineers must be able to right good and clear documentation about the systems they may be designing. This is crucial for large projects where many people may work on them over the course of some years.</span></p>
<p>
  <br>
</p>
<p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;"><span class="Apple-tab-span" style="white-space:pre;">&nbsp; &nbsp;&nbsp;</span></span><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Another path electrical engineers might opt for is research. There is a lot of research in this field yearly. This research is crucial in the development of new technologies and it is usually conducted in universities or companies. This career path will usually require a masters degree and/or a PHD.</span></p>
<p>
  <br>
</p>
<ul style="margin-top:0;margin-bottom:0;">
  <li dir="ltr" style="list-style-type:disc;font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;">
    <h2 dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Typical employers:</span></h2>
    <ul style="margin-top:0;margin-bottom:0;">
      <li dir="ltr" style="list-style-type:disc;font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;">
        <p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Telecommunications companies</span></p>
      </li>
      <li dir="ltr" style="list-style-type:disc;font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;">
        <p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Computing Companies</span></p>
      </li>
      <li dir="ltr" style="list-style-type:disc;font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;">
        <p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Utilities companies</span></p>
      </li>
      <li dir="ltr" style="list-style-type:disc;font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;">
        <p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Consulting firms</span></p>
      </li>
      <li dir="ltr" style="list-style-type:disc;font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;">
        <p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Civil Service</span></p>
      </li>
      <li dir="ltr" style="list-style-type:disc;font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;">
        <p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Armed forces</span></p>
      </li>
    </ul>
  </li>
</ul>
<p>
  <br>
</p>
<p>
  <br>
</p>
<h1 dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Hard Statistics:&nbsp;</span></h1>
<ul style="margin-top:0;margin-bottom:0;">
  <li dir="ltr" style="list-style-type:disc;font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;">
    <p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">New Grad Salary (Avg):&nbsp;</span><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">73,000 $</span></p>
  </li>
  <li dir="ltr" style="list-style-type:disc;font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;">
    <p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">&nbsp;Job Outlook:&nbsp;</span><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">2%&nbsp;</span></p>
  </li>
  <li dir="ltr" style="list-style-type:disc;font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;">
    <p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Unemployment Rate:&nbsp;</span><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">1.5%</span></p>
  </li>
</ul>
<p>
  <br>
</p>
<h1 dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Conclusion:&nbsp;</span></h1>
<p>
  <br>
</p>
<p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:13.999999999999998pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">In conclusion, electrical engineering is a great major for those with an aptitude for math and an interest in electrical systems. There is a wide array of career paths a graduate can take after graduation. It is a complicated major, so it is not recommended to enroll in it unless you are sure you can withstand the course work. The only issue with this major is the slower than average job outlook, this may be because a lot of jobs in this field are getting outsourced outside of the country.&nbsp;</span></p>
      """;

  String _base64Image =
      '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';

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

  void fetchItems() {
    _items = [
      Major(
          description: _lorumIpsum,
          id: 'Electrical Engineering',
          videoUrl: 'https://www.youtube.com/watch?v=Bm0V0UVqFtQ',
          base64Image: _base64Image),
      Major(
          description: _lorumIpsum,
          id: 'Mechanical Engineering',
          videoUrl: 'https://www.youtube.com/watch?v=Bm0V0UVqFtQ',
          base64Image: _base64Image),
      Major(
          description: _lorumIpsum,
          id: 'Aeronautical Engineering',
          videoUrl: 'https://www.youtube.com/watch?v=Bm0V0UVqFtQ',
          base64Image: _base64Image),
      Major(
          description: _lorumIpsum,
          id: 'Computer Engineering',
          videoUrl: 'https://www.youtube.com/watch?v=Bm0V0UVqFtQ',
          base64Image: _base64Image),
      Major(
          description: _lorumIpsum,
          id: 'Chemical Engineering',
          videoUrl: 'https://www.youtube.com/watch?v=Bm0V0UVqFtQ',
          base64Image: _base64Image),
    ];
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
