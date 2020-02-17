import 'package:college_app/widgets/major_item.dart';
import 'package:flutter/material.dart';
import 'package:convert/convert.dart';
import 'package:provider/provider.dart';

import '../providers/major_provider.dart';
import '../providers/major.dart';

class MajorGridList extends StatelessWidget {
  final List<Major> majorList;

  MajorGridList(this.majorList);

  @override
  Widget build(BuildContext context) {
    final majorData = Provider.of<MajorProvider>(context);

    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: majorList.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              //use when gridviews/lists are needed
              value: majorList[i],
              child: MajorItem(),
            ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10));
  }
}
