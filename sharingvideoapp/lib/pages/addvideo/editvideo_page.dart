import 'dart:io';
import 'package:sharingvideoapp/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharingvideoapp/components/video_player.dart';
import 'package:sharingvideoapp/pages/addvideo/post_page.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';


class EditVideoPage extends StatefulWidget {
  const EditVideoPage({Key key,this.path}) :super(key: key);
  final String path;

  @override
  _EditVideoPageState createState() => _EditVideoPageState();
}

class _EditVideoPageState extends State<EditVideoPage> {
  List<List<double>> filters = filterlist.values.elementAt(0);
  List<double> selectedFilter;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    //  print(widget.path);
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height - 150,
              child: selectedFilter == null ?
              VideoPlayerCustom(file: File(widget.path)) :
              ColorFiltered(
                colorFilter: ColorFilter.matrix(selectedFilter),
                child: VideoPlayerCustom(
                  file: File(widget.path),
                ),
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
            Positioned(
              right: 1.0,
              child: RaisedButton(
                color: Colors.red,
                onPressed: () async{
                  final _image= await getThumbnail();
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                    builder: (context) => PostPage(image: _image ,),
                  ));
                },
                child: Text("Next",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.black,
        height: 130,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        filters=filterlist.values.elementAt(0);
                      });
                    },
                    child: Text(filterlist.keys.elementAt(0),
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        filters=filterlist.values.elementAt(1);
                      });
                    },
                    child: Text(filterlist.keys.elementAt(1),
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        filters=filterlist.values.elementAt(2);
                      });
                    },
                    child: Text(filterlist.keys.elementAt(2),
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: GestureDetector(
                      child: ColorFiltered(
                        colorFilter: ColorFilter.matrix(filters[index]),
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            //color: Colors.red,
                            image: DecorationImage(
                              image: AssetImage('images/sunflower.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          selectedFilter = filters[index];
                         // print('tap tap');
                        });
                      },
                    ),
                  ) ;
                },
                itemCount: filters.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<Image> getThumbnail() async  {
    final thumbnailPath = await VideoThumbnail.thumbnailData(
      video: widget.path,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 128, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
      quality: 50,);
    return Image.memory(thumbnailPath);
  }
}
