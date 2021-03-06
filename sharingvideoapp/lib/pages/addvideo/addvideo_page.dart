import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharingvideoapp/components/custom_bottom_navigation_bar.dart';
import 'package:sharingvideoapp/components/video_player.dart';
import 'package:sharingvideoapp/components/video_trimmer.dart';
import 'package:sharingvideoapp/constant.dart';
import 'package:sharingvideoapp/pages/addvideo/addvideo_body.dart';
import 'package:video_player/video_player.dart';
import 'package:video_trimmer/video_trimmer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';



class AddVideoPage extends StatefulWidget {
  AddVideoPage({Key key}) : super(key: key);
  @override
  _AddVideoPage createState() => _AddVideoPage();
}

// class _AddVideoPage extends State<AddVideoPage> {
//
//   final List<List<double>> filters = [SUMMER, BLACKWHITE, OLDTIMES];
//
//   List<double> selectedFilter;
//   File videochosen;
//   final picker = ImagePicker();
//   @override
//   void initState(){
//     super.initState();
//   }
//
//   @override
//   void dispose(){
//     super.dispose();
//   }
//   Future<void> _showChoiceDialog(BuildContext context)
//   {
//     return showDialog(context: context, builder: (BuildContext context) {
//       return AlertDialog(
//         content:Wrap(
//           direction: Axis.vertical,
//           children: <Widget>[
//             GestureDetector(
//               child: Text("Gallery",
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//               onTap: fromGallery,
//
//             ),
//             Padding(padding: EdgeInsets.all(10)),
//             GestureDetector(
//               child: Text("Camera",
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//               onTap: capture,
//             ),
//           ],
//         ),
//       );
//     } );
//   }
//   @override
//   Widget build(BuildContext context) {
//     final Trimmer _trimmer = Trimmer();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Choose video',
//           style: TextStyle(
//             color: Colors.black,
//           ),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//       ),
//       body: Container(
//         alignment: Alignment.center,
//         color: Colors.white,
//         child: Column(
//           children: [
//             Expanded(
//               child: videochosen == null
//                   ? Text('No video selected.')
//                   :  selectedFilter==null? VideoPlayerCustom(file: videochosen) : ColorFiltered(
//                   colorFilter: ColorFilter.matrix(selectedFilter),
//                   child: VideoPlayerCustom(
//                     file: videochosen,),
//              ), //Image.file(videochosen),
//             ),
//
//             videochosen == null ? SizedBox() :
//             Expanded(
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (BuildContext context, int index){
//                   return GestureDetector(
//                     child: ColorFiltered(
//                       colorFilter: ColorFilter.matrix(filters[index]),
//                       child: Container(
//                         width: 75,
//                         height: 75,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           //color: Colors.red,
//                           image: DecorationImage(
//                             image: AssetImage('images/sunflower.jpg'),
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ),
//                     ),
//                     onTap: () {
//                       setState(() {
//                         selectedFilter= filters[index];
//                         print('tap tap');
//                       });
//                     },
//                   );
//                 },
//                 itemCount: filters.length,
//               ),
//             ),
//             FloatingActionButton(
//               heroTag: null,
//               onPressed: (){
//                 _showChoiceDialog(context);
//               },
//               tooltip: 'Pick Image',
//               child: Icon(Icons.add_a_photo),
//             ),
//             // FlatButton(
//             //     onPressed: capture,
//             //     child: Text('Choose video'),
//             // ),
//
//           ],
//         ),
//       ),
//       bottomNavigationBar: CustomBottomNavBar(
//         selectedMenu: MenuState.add,
//         backgroundcolor: Colors.white,
//       ),
//     );
//   }
//   Future fromGallery() async{
//     final pickedFile = await picker.getVideo(source: ImageSource.gallery);
//     final Trimmer _trimmer = Trimmer();
//
//     if (pickedFile != null) {
//       await _trimmer.loadVideo(videoFile: File(pickedFile.path),);
//       final videoEdited = await Navigator.of(context)
//           .push(MaterialPageRoute(
//         builder: (context) =>TrimmerView(_trimmer),
//       ));
//
//       setState(() {
//         if (videoEdited != null) {
//           videochosen = videoEdited;
//         } else {
//           print('No image selected.');
//         }
//       });  }
//   }
//   Future capture() async{
//     final pickedFile = await picker.getVideo(source: ImageSource.camera);
//     final Trimmer _trimmer = Trimmer();
//
//     if (pickedFile != null) {
//       await _trimmer.loadVideo(videoFile: File(pickedFile.path),);
//       final videoEdited = await Navigator.of(context)
//           .push(MaterialPageRoute(
//         builder: (context) =>TrimmerView(_trimmer),
//       ));
//
//       setState(() {
//         if (videoEdited != null) {
//           videochosen = videoEdited;
//         } else {
//           print('No image selected.');
//         }
//       });  }
//   }
// }

class _AddVideoPage extends State<AddVideoPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: Text('Hello'),
      // ),
      body: SafeArea(
        child: AddVideoBody(),

        // bottomNavigationBar: CustomBottomNavBar(
        //   selectedMenu: MenuState.add,
        //   backgroundcolor: Colors.white,
        // ),
      ),
    );
  }
}
