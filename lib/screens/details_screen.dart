import 'package:flutter/material.dart';
import '../providers/major_provider.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MajorProvider provider = Provider.of<MajorProvider>(context);
    return Column(
      children: <Widget>[
        Expanded(
          child: Center(
              child: Text('This is the About Page',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
        ),
        RaisedButton(
          child: Text("Clear Selections"),
          color: Theme.of(context).accentColor,
          onPressed: () => provider.clearSelections(),
        )
      ],
    );
  }
}
