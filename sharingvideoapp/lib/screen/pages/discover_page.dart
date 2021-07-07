import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sharingvideoapp/repository/fake_repository.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marquee/marquee.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:video_player/video_player.dart';
import 'package:sharingvideoapp/screen/discover_screen.dart';
import 'package:sharingvideoapp/screen/pages/trending_page.dart';

var ishit = false;

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final CommentController = TextEditingController();
  FocusNode _focus = FocusNode();

  final recentcities = [
    "thanh_nguyen",
    "Thienngan0392_",
    "DonChung_ft",
    "bachnguyenlephan",
  ];

  final cities = [
    "#hoanghon",
    "#binhminh",
    "#hoatim",
    "#hoahong"
        "thienNgan7932",
    "thanhnguyen",
    "tienquyen",
    "thuytrang9320",
    "thanch_canh nguyen",
    "Thien_baoquoc",
    "Tienthanhmai",
    "thaophan739_983",
    "thinNgan7932",
    "thinhnguyen",
    "thienguyenhoaphan",
    "thienly_09381",
    "thanch_canh nguyen",
    "Thien_baoquoc",
    "Tienthanhmai",
    "thaophan739_983",
    "th_nguyenhuyen",
  ];
  var filter_list = [];

  String textInTextField = '';

  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    //show when some one searches fỏr some one
    //throw UnimplementedError();
    final suggestionList = textInTextField.isEmpty
        ? recentcities
        : cities.where((p) => p.startsWith(textInTextField)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          ishit = false;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Search(),
            ),
          );
        },
        leading: Icon(Icons.access_time_rounded),
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );
  }

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    // debugPrint("Focus: "+_focus.hasFocus.toString());
    if (_focus.hasFocus)
      setState(() {
        ishit = true;
      });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Row(
              children: [
                Container(
                  // color: Colors.white70,
                  width: ishit == false ? 369 : 325,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(100, 189, 189, 189),
                    // color: Colors.white30,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 9),
                    child: InkWell(
                      child: TextField(
                        // clearOnSubmit: false,
                        onChanged: (text) {
                          setState(() {
                            textInTextField = CommentController.text;
                          });
                        },
                        focusNode: _focus,
                        controller: CommentController,
                        //suggestions: cities,
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                          icon: IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            // onPressed: () {
                            //   setState(
                            //     () {
                            //       ishit = !ishit;
                            //
                            //       print('hiiiiiiiiiiii');
                            //     },
                            //   );
                            // },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ishit == true
                    ? InkWell(
                        onTap: () {
                          // Navigator.pop(context);
                          ishit = !ishit;
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                          ),
                        ),
                      )
                    : SizedBox(
                        width: 0,
                      ),
              ],
            ),
          ),
          body: ishit == false
              ? SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        // _buildSearchContainer(sizingInformation),
                        SizedBox(
                          height: 15,
                        ),
                        _buildCarouselSlider(sizingInformation),
                        SizedBox(height: 15),
                        _buildTrendHeading(sizingInformation,
                            title: "OurSmiles",
                            range: "9.4m",
                            descrition: "Trending hashtag"),
                        SizedBox(
                          height: 10,
                        ),
                        _buildListView(1),
                        SizedBox(height: 20),
                        _buildTrendHeading(sizingInformation,
                            title: "SportLover",
                            range: "7.8m",
                            descrition: "Trending hashtag"),
                        SizedBox(
                          height: 10,
                        ),
                        _buildListView(2),
                        SizedBox(height: 20),
                        _buildTrendHeading(sizingInformation,
                            title: "OutFit",
                            range: "5.9m",
                            descrition: "Trending hashtag"),
                        SizedBox(
                          height: 10,
                        ),
                        _buildListView(3),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                )
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: buildSuggestions(context),
                ),
        );
      },
    );
  }

  Container _buildListView(var number) {
    if (number == 1)
      return Container(
        height: 175,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: FakeRepository.assetCriket.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 1),
                child: Container(
                  child: Image.network(FakeRepository.assetCriket[index]),
                ),
              );
            }),
      );
    else if (number == 2)
      return Container(
        height: 175,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: FakeRepository.assetDataSportLover.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 1),
                child: Container(
                  child:
                      Image.network(FakeRepository.assetDataSportLover[index]),
                ),
              );
            }),
      );
    else
      return Container(
        height: 175,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: FakeRepository.assetDataOutFit.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 1),
                child: Container(
                  child: Image.network(FakeRepository.assetDataOutFit[index]),
                ),
              );
            }),
      );
  }

  Container _buildTrendHeading(SizingInformation sizingInformation,
      {String title, String descrition, String range}) {
    return Container(
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TrendingPage(),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(100, 227, 225, 225), width: 1.4),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: Text(
                  "#",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: sizingInformation.localWidgetSize.width * 0.80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(190, 0, 0, 0),
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(100, 227, 225, 225),
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  range,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(190, 0, 0, 0),
                                  ),
                                ),
                                Icon(
                                  Icons.navigate_next,
                                  color: Colors.black,
                                  size: 17,
                                ),

                                // Icon()
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      descrition,
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        color: Color.fromARGB(100, 89, 89, 89),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _buildCarouselSlider(SizingInformation sizingInformation) {
    return Container(
      height: 180,
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 2.0,
          aspectRatio: 0.10,
          autoPlay: true,
          height: 180,
        ),
        items: FakeRepository.imageData.map((imageUlr) {
          return Image.network(
            imageUlr,
            fit: BoxFit.cover,
            width: sizingInformation.screenSize.width,
            loadingBuilder: (context, child, loading) {
              if (loading == null) return child;
              return Padding(
                padding: const EdgeInsets.all(60),
                child: FittedBox(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
