import 'package:flutter/material.dart';
import 'package:youtube_player/youtube_player.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class MajorYoutubeVideo extends StatefulWidget {
  final String videoUrl;
  MajorYoutubeVideo(this.videoUrl);

  @override
  _MajorYoutubeVideoState createState() => _MajorYoutubeVideoState();
}

class _MajorYoutubeVideoState extends State<MajorYoutubeVideo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: YoutubePlayer(
        context: context,
        source: "nPt8bK2gbaU",
        quality: YoutubeQuality.HD,
        showThumbnail: true,
        autoPlay: true,
        // callbackController is (optional).
        // use it to control player on your own.
      ),
    );
  }
}
