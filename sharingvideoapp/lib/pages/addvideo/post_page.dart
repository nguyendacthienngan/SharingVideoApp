
import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharingvideoapp/components/dropdown_button.dart';
import 'package:sharingvideoapp/components/switch_button.dart';
import 'package:sharingvideoapp/pages/home/home_page.dart';
import 'package:sharingvideoapp/screen/home_screen.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import 'package:sharingvideoapp/screen/home_screen.dart';

class PostPage extends StatelessWidget{
  PostPage({Key key,this.image}):super (key: key);
  final image;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Post',
          style: TextStyle(
              color: Colors.black
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 2,
                          color: Theme
                              .of(context)
                              .dividerColor),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            maxLines: 9,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Add description',

                            ),
                          ),
                        ),
                        image,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 2, 20, 2),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0,0,8,0),
                        child: Icon(Icons.lock_outline_rounded,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                      Expanded(
                        child: Text('Who can watch this video'),
                      ),
                      Dropdown(),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 2, 20, 2),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0,0,8,0),
                        child: Icon(Icons.chat_bubble_outline_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                      Expanded(
                        child: Text('Allow comments'),
                      ),
                      SwitchButton(),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 2, 20, 2),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0,0,8,0),
                        child: Icon(Icons.save_alt_outlined,
                            color: Colors.black,
                            size: 20,
                        ),
                      ),
                      Expanded(
                        child: Text('Save to device'),
                      ),
                      SwitchButton(),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 2, 20, 2),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                          child: RaisedButton(
                            color: Colors.grey,
                            onPressed: () => showDialog(context: context, builder: (BuildContext context)=>
                                AlertDialog(
                                  title: Text('Discard post?'),
                                  content: Text('You will lost the video.'),
                                  actions: [
                                    FlatButton(
                                      textColor: Color(0xFF6200EE),
                                      onPressed: () => Navigator.pop(context, 'Cancel'),
                                      child: Text('CANCEL'),
                                    ),
                                    FlatButton(
                                      textColor: Color(0xFF6200EE),
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(builder: (context) => HomeScreen()),
                                              (Route<dynamic> route) => false);
                                        },
                                      child: Text('DISCARD'),
                                    ),
                                  ],
                                ),),
                            child: Text("Cancel",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                          child: RaisedButton(
                            color: Colors.red,
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => HomeScreen()),
                                    (Route<dynamic> route) => false);
                            },
                            child: Text("Next",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


