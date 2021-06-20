import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sharingvideoapp/components/video_trimmer.dart';
import 'package:video_trimmer/video_trimmer.dart';

List<CameraDescription> cameras;

class AddVideoBody extends StatefulWidget{
  AddVideoBody({Key key}): super(key: key);
  @override
  _AddVideoBodyState createState()=> _AddVideoBodyState();

}

class _AddVideoBodyState extends State<AddVideoBody> {
  CameraController _cameraController;
  Future<void> cameraValue;
  bool isRecording = false;
  String videopath = "";
  final picker = ImagePicker();
  bool isCameraFront = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Trimmer _trimmer = Trimmer();
    return Container(
      child: Stack(
        children: [
          FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Center(child: CameraPreview(_cameraController));
                }
                else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close,
              color: Colors.white,
              size: 40,),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.flash_off,
                color: Colors.white,
                size: 40,),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () async {
                          setState(() {
                            isCameraFront = !isCameraFront;
                          });
                          int cameraPos = isCameraFront ? 0 : 1;
                          _cameraController = CameraController(
                              cameras[cameraPos], ResolutionPreset.high);
                          cameraValue = _cameraController.initialize();
                        },
                        icon: Icon(Icons.flip_camera_ios,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (!isRecording) {
                            await _cameraController.startVideoRecording();
                            setState(() {
                              isRecording = true;
                            });
                          }
                          else {
                            final path = await _cameraController
                                .stopVideoRecording();
                            setState(() {
                              isRecording = false;
                              videopath = path.path;
                            });
                            if (videopath != null || videopath != "") {
                              await _trimmer.loadVideo(
                                videoFile: File(videopath),);
                              Navigator.of(context)
                                  .push(MaterialPageRoute(
                                builder: (context) => TrimmerView(_trimmer),
                              ));
                            }
                          }
                        },
                        child: isRecording ?
                        Icon(Icons.radio_button_on,
                          color: Colors.red,
                          size: 80,
                        ) :
                        Icon(Icons.fiber_manual_record_outlined,
                          color: Colors.white,
                          size: 80,
                        ),
                      ),
                      IconButton(onPressed: () async {
                        fromGallery(context);
                      },
                        icon: Icon(Icons.image_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                  Text('Tap to record video',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future fromGallery(BuildContext context) async {
    final pickedFile = await picker.getVideo(source: ImageSource.gallery);
    final Trimmer _trimmer = Trimmer();

    if (pickedFile != null) {
      await _trimmer.loadVideo(videoFile: File(pickedFile.path),);
      final videoEdited = await Navigator.of(context)
          .push(MaterialPageRoute(
        builder: (context) => TrimmerView(_trimmer),
      ));
    }
  }
}
