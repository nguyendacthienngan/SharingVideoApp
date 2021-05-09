import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerCustom extends StatefulWidget{
  VideoPlayerCustom({
    Key key,
    this.source,
    this.file
  }) : super (key:key);
  final String source;
  final File file;
  @override
  _VideoPlayerCustom createState() => _VideoPlayerCustom();
}

class _VideoPlayerCustom extends State<VideoPlayerCustom> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState(){
    if (widget.source!= null)
    _controller = VideoPlayerController.network(widget.source);//'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'
    else _controller = VideoPlayerController.file(widget.file);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                );
              }
              else {
                return Center(child: CircularProgressIndicator(),
                );
              }
            },
          ),
          FloatingActionButton(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              onPressed: () {
                // Wrap the play or pause in a call to `setState`. This ensures the
                // correct icon is shown.
                setState(() {
                  // If the video is playing, pause it.
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    // If the video is paused, play it.
                    _controller.play();
                  }
                });
              },
              // Display the correct icon depending on the state of the player.
              child: _controller.value.isPlaying ? Icon(
                Icons.pause, color: Colors.transparent,) : Icon(
                  Icons.play_arrow)
          ),
        ],
      ),
    );
  }

}