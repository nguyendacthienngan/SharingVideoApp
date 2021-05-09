import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharingvideoapp/components/custom_bottom_navigation_bar.dart';
import 'package:sharingvideoapp/components/video_player.dart';
import 'package:sharingvideoapp/components/video_trimmer.dart';
import 'package:sharingvideoapp/constant.dart';
import 'package:sharingvideoapp/pages/home/home_body.dart';
import 'package:video_player/video_player.dart';
import 'package:video_trimmer/video_trimmer.dart';
import 'package:image_picker/image_picker.dart';


class AddVideoPage extends StatefulWidget {
  AddVideoPage({Key key}) : super(key: key);
  @override
  _AddVideoPage createState() => _AddVideoPage();
}

class _AddVideoPage extends State<AddVideoPage> {
  File videochosen;
  final picker = ImagePicker();
  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Trimmer _trimmer = Trimmer();
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'Choose video',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body:Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: videochosen == null
            ? Text('No video selected.')
              : VideoPlayerCustom(file: videochosen,),//Image.file(videochosen),
            ),
            FloatingActionButton(
              onPressed: capture,
              tooltip: 'Pick Image',
              child: Icon(Icons.add_a_photo),
            ),
            // FlatButton(
            //     onPressed: capture,
            //     child: Text('Choose video'),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.add,
        backgroundcolor: Colors.white,
      ),
    );
  }
  Future capture() async{
    //final getMedia = ImagePicker();
    final pickedFile = await picker.getVideo(source: ImageSource.gallery);
    final Trimmer _trimmer = Trimmer();
    //final file = File(video.path);

    if (pickedFile != null) {
      await _trimmer.loadVideo(videoFile: File(pickedFile.path),);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) {
        return TrimmerView(_trimmer);
      }));

      setState(() {
        if (pickedFile != null) {
          videochosen = File(pickedFile.path);
        } else {
          print('No image selected.');
        }
      });  }
  }
}
