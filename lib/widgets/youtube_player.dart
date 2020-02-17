import 'package:flutter/material.dart';
import 'package:youtube_player/youtube_player.dart';

class MajorYoutubeVideo extends StatelessWidget {
  final String videoUrl;
  MajorYoutubeVideo(this.videoUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: YoutubePlayer(
        context: context,
        source: this.videoUrl,
        quality: YoutubeQuality.HD,
        // callbackController is (optional).
        // use it to control player on your own.
      ),
    );
  }
}
