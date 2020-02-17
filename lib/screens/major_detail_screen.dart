import 'package:college_app/providers/major.dart';
import 'package:flutter/material.dart';
import '../providers/major.dart';
import '../widgets/major_detail.dart';

class MajorDetailScreen extends StatelessWidget {
  static const String routeName = '/major-detail-screen';
  final Major major;

  MajorDetailScreen(this.major);

  String _getPageTitle(MajorStatus status) {
    if (status == MajorStatus.Liked) {
      return "Liked Major";
    } else if (status == MajorStatus.Disliked) {
      return "Disliked Major";
    }
    return "Maybe Major";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getPageTitle(this.major.status)),
      ),
      body: MajorDetailPage(major, true),
      //Text('Test'));
    );
  }
}
