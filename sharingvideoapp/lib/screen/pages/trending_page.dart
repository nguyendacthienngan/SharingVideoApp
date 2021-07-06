import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sharingvideoapp/repository/fake_repository.dart';

class TrendingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        return Scaffold(
          appBar: AppBar(
            actionsIconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      FontAwesomeIcons.share,
                      size: 26.0,
                      color: Colors.black,
                    ),
                  )
              ),
            ],
          ),
          body: Container(
               child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          child:Image.asset(FakeRepository.assetData[1]),
                          width: 150,
                          height: 150,
                        ),
                        Expanded(
                          child: Container(
                            height: 150,
                            alignment: Alignment.topLeft,
                            child:Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '#TestNhanPham',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '351.4M views',
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Expanded(
                                child: Align(
                                alignment: Alignment.bottomLeft,
                                child: GestureDetector(
                                  onTap:(){
                                    print("Add to favorites");
                                  },
                                  child: Container(
                                    alignment:Alignment.bottomLeft,
                                    margin: const EdgeInsets.fromLTRB(0, 15, 15,15),
                                    padding: const EdgeInsets.all(3.0),
                                    width: 130,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.bookmark,
                                          size: 20,
                                        ),
                                        Text('Add to favorites'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),),

                            ],
                          ),
                        ),),
                      ],
                    ),
                   Align(

                     alignment: Alignment.topLeft,
                     child: Container(
                       margin: const EdgeInsets.fromLTRB(15, 15, 15,15),
                       child: Text("Đây là mô tả"),
                     ),
                   ),
                   // ListView.builder(
                   //      itemCount: FakeRepository.assetData.length,
                   //      itemBuilder: (_, index) {
                   //        return Container(
                   //          width: 150,
                   //          height: 150,
                   //          child: Image.asset(FakeRepository.assetData[index]),
                   //        );
                   //      }
                   //  ),

                  ],
                ),
              ),
         ),
        );
      },
    );
  }
}
