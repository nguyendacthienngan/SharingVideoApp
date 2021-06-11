import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharingvideoapp/components/video_player.dart';
import 'package:video_player/video_player.dart';

class HomeBody extends StatefulWidget{
  HomeBody({Key key}) : super (key:key);
  @override
  _HomeBody createState() => _HomeBody();
}

class _HomeBody extends State<HomeBody> {


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: VideoPlayerCustom(source: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',)
    );
  }

}