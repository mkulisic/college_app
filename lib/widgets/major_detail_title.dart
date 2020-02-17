import 'package:flutter/material.dart';

class MajorDetailTitle extends StatelessWidget {
  final String title;

  MajorDetailTitle(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      height: 50,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }
}
