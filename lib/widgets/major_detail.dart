import 'package:college_app/providers/major_provider.dart';
import 'package:college_app/widgets/major_description.dart';
import 'package:college_app/widgets/youtube_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/major.dart';
import './major_detail_title.dart';
import './major_detail.dart';

class MajorDetailPage extends StatefulWidget {
  static const String routeName = '/major-detail';
  final Major major;
  final bool newScreen;

  MajorDetailPage(this.major, this.newScreen);

  @override
  _MajorDetailPageState createState() => _MajorDetailPageState();
}

class _MajorDetailPageState extends State<MajorDetailPage>
    with SingleTickerProviderStateMixin {
  double leftMargin = 0;
  double rightMargin = 0;
  double topMargin = 0;

  //animations
  Animation<double> animation;

  //controllers
  AnimationController controller;

  Padding _buildFloatingButton(
    Icon buttonIcon,
    Function pressFunc,
    Color buttonColor,
    int index,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FloatingActionButton(
        backgroundColor: buttonColor,
        onPressed: pressFunc,
        child: buttonIcon,
        heroTag: 'Screen_' + widget.newScreen.toString() + index.toString(),
      ),
    );
  }

  double get adjLeftMargin {
    switch (widget.major.status) {
      case MajorStatus.Liked:
        return leftMargin;
      case MajorStatus.Disliked:
        return rightMargin;
      default:
        return 0;
    }
  }

  double get adjTopMargin {
    return widget.major.status == MajorStatus.Maybe ? topMargin : 0;
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    animation = Tween<double>(begin: 0, end: 110).animate(controller)
      ..addListener(() {
        setState(() {
          //print(animation.value);
          leftMargin =
              MediaQuery.of(context).size.width * animation.value / 100;
          rightMargin =
              -MediaQuery.of(context).size.width * animation.value / 100;
          topMargin =
              MediaQuery.of(context).size.height * animation.value / 100;
        });
      });
  }

  void _changeMajorStatus(Major major, MajorStatus newStatus,
      MajorProvider majorProvider, BuildContext ctx, MajorProvider provider) {
    if (newStatus == MajorStatus.Liked) {
      majorProvider.setMajorLike(major.id);
    } else if (newStatus == MajorStatus.Disliked) {
      majorProvider.setMajorDislike(major.id);
    } else if (newStatus == MajorStatus.Maybe) {
      majorProvider.setMajorMaybe(major.id);
    }
    controller.forward().then((_) {
      if (!widget.newScreen) {
        controller.reset();
        majorProvider.updateCurrentMajor();
      } else {
        Navigator.pop(ctx);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MajorProvider provider = Provider.of<MajorProvider>(context);
    return widget.major == null
        ? NoMajorsLeft()
        : Container(
            transform:
                Matrix4.translationValues(adjLeftMargin, adjTopMargin, 0),
            child: Card(
              elevation: 15,
              child: Stack(children: <Widget>[
                SingleChildScrollView(
                  child: IntrinsicHeight(
                    child: Column(
                      children: <Widget>[
                        MajorDetailTitle(widget.major.id),
                        MajorYoutubeVideo(widget.major.videoUrl),
                        MajorDescription(widget.major.description),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.10,
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _buildFloatingButton(
                              Icon(Icons.thumb_up),
                              () => _changeMajorStatus(
                                  this.widget.major,
                                  MajorStatus.Liked,
                                  provider,
                                  context,
                                  provider),
                              Colors.green,
                              1),
                          _buildFloatingButton(
                              Icon(Icons.thumbs_up_down),
                              () => _changeMajorStatus(
                                  this.widget.major,
                                  MajorStatus.Maybe,
                                  provider,
                                  context,
                                  provider),
                              Colors.amber,
                              2),
                          _buildFloatingButton(
                              Icon(Icons.thumb_down),
                              () => _changeMajorStatus(
                                  this.widget.major,
                                  MajorStatus.Disliked,
                                  provider,
                                  context,
                                  provider),
                              Colors.red,
                              3),
                        ]))
              ]),
            ),
          );
  }
}

class NoMajorsLeft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Text(
            'No More Majors',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
          ),
        )
      ],
    );
  }
}
