import 'package:flutter/material.dart';
import 'package:sharingvideoapp/components/custom_bottom_navigation_bar.dart';
import 'package:sharingvideoapp/pages/addvideo/addvideo_page.dart';
import 'package:sharingvideoapp/pages/home/home_page.dart';

void main()=> runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: HomePage(),
        initialRoute: '/home',
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => new HomePage(),
          '/add':(BuildContext context) => new AddVideoPage(),
        }
    );
  }
}
