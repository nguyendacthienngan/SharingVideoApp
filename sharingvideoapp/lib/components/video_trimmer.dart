
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharingvideoapp/pages/addvideo/editvideo_page.dart';
import 'package:video_trimmer/video_trimmer.dart';

class TrimmerView extends StatefulWidget {
  final Trimmer _trimmer;
  TrimmerView(this._trimmer);
  @override
  _TrimmerViewState createState() => _TrimmerViewState();
}

class _TrimmerViewState extends State<TrimmerView> {
  double _startValue = 0.0;
  double _endValue = 0.0;

  bool _isPlaying = false;
  bool _progressVisibility = false;
  String path;
  Future<String> _saveVideo() async {
    setState(() {
      _progressVisibility = true;
    });

    String _value;

    await widget._trimmer
        .saveTrimmedVideo(startValue: _startValue, endValue: _endValue,outputFormat: FileFormat.mp4)
        .then((value) {
      setState(() {
        _progressVisibility = false;
        _value = value;

      });
    });
    return _value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Builder(
        builder: (context) => Center(
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Visibility(
                    visible: _progressVisibility,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.red,
                    ),
                  ),
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height - 150,
                    child: Stack(
                      children: [

                        VideoViewer(),
                        Positioned(
                          right: 1.0,
                            child: RaisedButton(
                              color: Colors.red,
                              onPressed: _progressVisibility
                                  ? null
                                  : () async {
                                _saveVideo().then((outputPath) {
                                  print('OUTPUT PATH: $outputPath');
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(
                                    builder: (context) => EditVideoPage(path: outputPath),
                                  ));
                                });


                              },
                              child: Text("Next",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              ),
                            ),
                        ),
                        Center(
                          child: FlatButton(
                            child: _isPlaying
                                ? Icon(
                              Icons.pause,
                              size: 80.0,
                              color: Colors.transparent,
                            )
                                : Icon(
                              Icons.play_arrow,
                              size: 80.0,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              bool playbackState =
                              await widget._trimmer.videPlaybackControl(
                                startValue: _startValue,
                                endValue: _endValue,
                              );
                              setState(() {
                                _isPlaying = playbackState;
                              });
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back,
                            color: Colors.white,
                            size: 40,),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    child: TrimEditor(
                      viewerHeight: 50.0,
                      viewerWidth: MediaQuery.of(context).size.width-20,
                      maxVideoLength: Duration(seconds: 15),
                      onChangeStart: (value) {
                        _startValue = value;
                      },
                      onChangeEnd: (value) {
                        _endValue = value;
                      },
                      onChangePlaybackState: (value) {
                        setState(() {
                          _isPlaying = value;
                        });
                      },
                    ),
                  ),

                ],
              ),
            ),
          ),

        ),
      ),
    );
  }
}
