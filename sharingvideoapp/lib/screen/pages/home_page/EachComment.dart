import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';

class Eachcomment extends StatefulWidget {
  final String name;
  final String url;
  final String comment;
   bool is_favorite=false;

  Eachcomment(this.name, this.url, this.comment);

  @override
  _EachcommentState createState() => _EachcommentState();
}

class _EachcommentState extends State<Eachcomment> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: (){
        setState(() {
          widget.is_favorite=!widget.is_favorite;
        });
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(widget.url),
        ),
        title: Text(
          widget.name,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          widget.comment,
          style: TextStyle(fontSize: 13),
        ),
        trailing: widget.is_favorite==false? Icon(Icons.favorite_border):Icon(Icons.favorite,color: Colors.redAccent,),

        // trailing:  FavoriteButton(
        //   iconSize: 30,
        //   isFavorite: false,
        //   valueChanged: (_isFavorite) {
        //     print('Is Favorite : $_isFavorite');
        //   },
        // ),

      ),
    );
  }
}
