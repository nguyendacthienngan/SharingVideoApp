

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget{
  SwitchButton({Key key}): super (key:key);
  @override
  _SwitchButtonState createState()=> _SwitchButtonState();

}

class _SwitchButtonState extends State<SwitchButton>{
  bool isSwitched=false;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      onChanged: (value) {
        setState(() {
          isSwitched = value;
          print(isSwitched);
        });
      },
      activeTrackColor: Colors.green,
      activeColor: Colors.lightGreenAccent,
    );
  }
}
