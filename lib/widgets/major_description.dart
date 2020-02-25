import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class MajorDescription extends StatelessWidget {
  final String description;

  MajorDescription(this.description);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: HtmlWidget(
          description,
        ),
        padding: EdgeInsets.all(10),
      ),
    );
  }
}
