import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/major.dart';
import '../screens/major_detail_screen.dart';
import '../animations/custom_transition.dart';

import 'dart:typed_data';
import 'dart:convert';

import '../providers/major_provider.dart';

class MajorItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Major>(
        //use when only subpart of subtree needs to be re-rendered
        builder: (ctx, major, child) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GridTile(
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        CustomTransition(
                          builder: (context) => MajorDetailScreen(major),
                        ),
                      );
                    },
                    child: Image.memory(base64Decode(major.base64Image),
                        fit: BoxFit.cover)),
                footer: GridTileBar(
                  backgroundColor: Colors.black87,
                  title: Text(
                    major.id,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ));
  }
}
