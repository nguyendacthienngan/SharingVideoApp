import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharingvideoapp/constant.dart';
import 'package:sharingvideoapp/pages/addvideo/addvideo_page.dart';
import 'package:sharingvideoapp/pages/discover/discover_page.dart';
import 'package:sharingvideoapp/pages/home/home_page.dart';
class CustomBottomNavBar extends StatelessWidget
{
  CustomBottomNavBar({
    Key key,
    @required this.selectedMenu,
    this.backgroundcolor = Colors.white,
  }): super(key:key);
  final Color backgroundcolor;
  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: this.backgroundcolor,
        border: Border(
          top: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: 20,),
          IconButton(
            icon: Icon(Icons.home),
            color: this.backgroundcolor == Colors.white? Colors.black :Colors.white,
            iconSize: 40,
            onPressed: () =>
            {
              if (selectedMenu != MenuState.home)
                {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                        (Route<dynamic> route) => false,),
                }},
          ),
          Expanded(
            child: IconButton(
              icon: Icon(Icons.search),
              color: this.backgroundcolor == Colors.white? Colors.black :Colors.white,
              iconSize: 40,
              onPressed: ()=> {
                if (selectedMenu != MenuState.search)
                  {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => DiscoverPage()),
                          (Route<dynamic> route) => false,),
                  }
              },
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(Icons.add),
              color: this.backgroundcolor == Colors.white? Colors.black :Colors.white,
              iconSize: 40,
              onPressed: () => {
                if (selectedMenu != MenuState.add)
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddVideoPage())),
                  }
              },
            ),
          ),
          Expanded(
            child:  IconButton(
                icon: Icon(Icons.message),
                color: this.backgroundcolor == Colors.white? Colors.black :Colors.white,
                iconSize: 40,
                onPressed: () => {
                  if (selectedMenu != MenuState.message)
                    {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                            (Route<dynamic> route) => false,),
                    }
                }
            ),
          ),
          IconButton(
            icon: Icon(Icons.person),
            color: this.backgroundcolor == Colors.white? Colors.black :Colors.white,
            iconSize: 40,
            onPressed: () => {
              if (selectedMenu != MenuState.profile)
                {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                        (Route<dynamic> route) => false,),
                }
            },
          ),
          SizedBox(width: 20,),
        ],
      ),
    );
  }

}
