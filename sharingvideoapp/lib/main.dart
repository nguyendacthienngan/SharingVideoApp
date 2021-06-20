import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sharingvideoapp/components/custom_bottom_navigation_bar.dart';
import 'package:sharingvideoapp/pages/addvideo/addvideo_body.dart';
import 'package:sharingvideoapp/pages/addvideo/addvideo_page.dart';
import 'package:sharingvideoapp/pages/discover/discover_page.dart';
import 'package:sharingvideoapp/pages/home/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras= await availableCameras();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: HomePage(),
        //initialRoute: '/home',
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => new HomePage(),
          '/add':(BuildContext context) => new AddVideoPage(),
          '/discover':(BuildContext context)=> new DiscoverPage(),
        }
    );
  }
}
