//import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';

//import 'EachComment.dart';
import 'package:sharingvideoapp/screen/pages/discover_page.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  //var ishit = false;
  final CommentController = TextEditingController();
  FocusNode _focus = FocusNode();

  final recentcities = [
    "thanh_nguyen",
    "Thienngan0392_",
    "DonChung_ft",
    "bachnguyenlephan",
  ];

  final cities = [
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

  // Widget buildSuggestions(BuildContext context) {
  //   // TODO: implement buildSuggestions
  //   //show when some one searches fỏr some one
  //   //throw UnimplementedError();
  //   final suggestionList = textInTextField.isEmpty
  //       ? recentcities
  //       : cities.where((p) => p.startsWith(textInTextField)).toList();
  //
  //   return ListView.builder(
  //     itemBuilder: (context, index) => ListTile(
  //       onTap: () {
  //         //showResults(context);
  //       },
  //       leading: Icon(Icons.access_time_rounded),
  //       title: Text(suggestionList[index]),
  //     ),
  //     itemCount: suggestionList.length,
  //   );
  // }

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
          print('heeeeeeeeeeeeeee');
          print(ishit);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => Search(),
          //   ),
          // );
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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          //  không có nút back mặc định
          //backgroundColor: Colors.white70,

          title: Row(
            children: [
              Container(
                width: 330, //<====== CHỖ NÀY
                decoration: BoxDecoration(
                  color: Color.fromARGB(100, 189, 189, 189),
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
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        icon: IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            // setState(() {
                            //   ishit = !ishit;
                            //   //print('hiiiiiiiiiiii');
                            // });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  FocusManager.instance.primaryFocus?.unfocus();
                  ishit = false;
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ],
          ),

          // actions: [
          //   IconButton(
          //     icon: Icon(Icons.search),
          //     onPressed: () {
          //       ishit = true;
          //       // print(ishit);
          //
          //       showSearch(
          //         context: context,
          //         delegate: DataSearch(),
          //       );
          //     },
          //   )
          // ],

          /*bottom:  TabBar(
                  //isScrollable: true,
                  //indicatorColor: Colors.white,// mau dang chon tap nao
                  indicatorColor: Colors.grey,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorWeight: 2,
                  tabs: [
                    Tab(text: 'Home'),
                    Tab(text: 'Feed'),
                    Tab(text: 'Profile'),
                    Tab(text: 'Settings'),
                  ],
                ),*/

          bottom: ishit == false
              ? TabBar(
                  //indicatorColor: Colors.white,// mau dang chon tap nao
                  indicatorColor: Colors.black12,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,

                  indicatorWeight: 2,
                  tabs: [
                    Tab(text: 'Top'),
                    Tab(text: 'Users'),
                    Tab(text: 'Videos'),
                    Tab(text: 'Hashtags'),
                    //Tab(text: 'Settings'),
                  ],
                )
              : null,

          elevation: 0,
          // titleSpacing: 20,
        ),

        // body: IconButton(
        //   icon: Icon(Icons.search),
        //   onPressed: () {
        //     showSearch(context: context, delegate: DataSearch());
        //   },
        // ),

        body: ishit == false
            ? TabBarView(
                children: [
                  buildPage('Top'),
                  buildPage('Users'),
                  buildPage('Videos'),
                  buildPage('Hashtags'),
                ],
              )
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: buildSuggestions(context),
              ),
      ),
    );
  }

  Widget buildPage(String text) => Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Users',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'See more',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 4, 0, 10),
              child: ListTile(
                leading: CircleAvatar(
                  // offset: Offset(-16, 0),
                  radius: 25,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1597848212624-a19eb35e2651?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c3VuJTIwZmxvd2VyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=60'),
                ),
                title: Text(
                  '@diy123',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(
                  'Videos',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              // to disable GridView's scrolling
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 4 / 6,
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

              ],
            ),

            // Row(
            //   children: [
            //     Expanded(
            //       child: Image.network(
            //           'https://images.unsplash.com/photo-1541397162856-74cedf47619c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGRhd258ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=60'),
            //     ),
            //     Expanded(
            //       child: Image.network(
            //           'https://images.unsplash.com/photo-1541397162856-74cedf47619c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGRhd258ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=60'),
            //     ),
            //   ],
            // )

            // Row(
            //   children: [
            //     Card(
            //       child: buildPictureCard(
            //         'https://images.unsplash.com/photo-1541397162856-74cedf47619c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGRhd258ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=60',
            //       ),
            //     ),
            //     // buildPictureCard(
            //     //   'https://images.unsplash.com/photo-1541397162856-74cedf47619c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGRhd258ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=60',
            //     // ),
            //   ],
            // ),
            // Text('gi')
          ],
        ),
      );
}

Card buildPictureCard(String url) {
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(
        //borderRadius: BorderRadius.circular(30),

        ),
    child: Container(
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            url,
          ),
        ),
      ),
    ),
  );
}
