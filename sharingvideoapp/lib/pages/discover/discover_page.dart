
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharingvideoapp/components/custom_bottom_navigation_bar.dart';
import 'package:sharingvideoapp/constant.dart';




class DiscoverPage extends StatefulWidget {
  DiscoverPage({Key key}) : super(key: key);
  @override
  _DiscoverPage createState() => _DiscoverPage();
}

class _DiscoverPage extends State<DiscoverPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose video',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.add,
        backgroundcolor: Colors.white,
      ),
    );
  }
}
