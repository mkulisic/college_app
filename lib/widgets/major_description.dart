import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class MajorDescription extends StatelessWidget {
  final String description;

  MajorDescription(this.description);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Html(
          data: description,
        ),
        padding: EdgeInsets.all(10),
      ),
    );
  }
}
