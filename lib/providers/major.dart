import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum MajorStatus { Liked, Disliked, Maybe, None }

class Major with ChangeNotifier {
  final String id;
  final String description;
  final String videoUrl;
  final base64Image;

  MajorStatus status = MajorStatus.None;

  Major({this.id, this.description, this.videoUrl, this.base64Image});

  void setLiked() {
    status = MajorStatus.Liked;
  }

  void setDislike() {
    status = MajorStatus.Disliked;
  }

  void setMaybe() {
    status = MajorStatus.Maybe;
  }

  void setNone() {
    status = MajorStatus.None;
  }

  Major clone() {
    return Major(
        videoUrl: this.videoUrl, id: this.id, description: this.description);
  }
}
