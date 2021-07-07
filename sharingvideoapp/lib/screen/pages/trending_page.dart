import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sharingvideoapp/repository/fake_repository.dart';
import 'package:flutter/material.dart';
import 'package:sharingvideoapp/screen/pages/discover_page.dart';
import 'package:sharingvideoapp/screen/discover_screen.dart';


class TrendingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            actionsIconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                FontAwesomeIcons.arrowLeft,

                size: 20.0,
                color: Colors.black,
              ),
            ),
            actions: <Widget>[


              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                    },
                    child: Icon(
                      FontAwesomeIcons.share,
                      size: 20.0,
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
                                  '#OurSmiles',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '3.4M views',
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
                                    width: 140,
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
                       child: Text("The testing can be done at system, integration and unit levels of software development. One of the basic goals of whitebox testing is to verify a working flow for an application."),
                     ),
                   ),
                    GridView.count(
                      physics: NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      childAspectRatio: 5 / 6,
                      children: [
                        buildPictureCard(
                            'https://images.unsplash.com/photo-1541397162856-74cedf47619c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGRhd258ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=60'),
                        buildPictureCard(
                            'https://images.unsplash.com/photo-1588713007734-b199ac8cb465?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8ZGF3bnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=60'),
                        buildPictureCard(
                            'https://images.unsplash.com/photo-1503864664483-e8a499e2eb22?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=512&q=80'),
                        buildPictureCard(
                            'https://images.unsplash.com/photo-1589441931743-900205c41d7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80'),
                        buildPictureCard(
                            'https://images.unsplash.com/photo-1562555135-a9788949bc4b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=656&q=80'),
                        buildPictureCard(
                            'https://images.unsplash.com/photo-1583327375964-8f969ea45f59?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=892&q=80'),
                        buildPictureCard(
                            'https://images.unsplash.com/photo-1612195745262-89163d541059?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTh8fGRhd24lMjBsaWdodHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'),
                        buildPictureCard(
                            'https://images.unsplash.com/photo-1595057083625-5e33c9372312?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGRhd24lMjBsaWdodHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'),
                        buildPictureCard(
                            'https://images.unsplash.com/photo-1562555135-a9788949bc4b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=656&q=80'),
                        buildPictureCard(
                            'https://images.unsplash.com/photo-1583327375964-8f969ea45f59?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=892&q=80'),
                        buildPictureCard(
                            'https://images.unsplash.com/photo-1612195745262-89163d541059?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTh8fGRhd24lMjBsaWdodHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'),
                        buildPictureCard(
                            'https://images.unsplash.com/photo-1595057083625-5e33c9372312?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGRhd24lMjBsaWdodHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'),

                      ],
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
