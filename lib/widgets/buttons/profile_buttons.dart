import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'button.dart';

class FollowButton extends StatelessWidget {
  double margin;

  FollowButton({this.margin = 0});

  @override
  Widget build(BuildContext context) {
    return
    Container(
        margin: EdgeInsets.fromLTRB(0, margin, 0, margin),
        child: ToggableButton(child: Text("Follow")));
  }
}

class MessageButton extends StatelessWidget {
  double margin;
  var primaryColor = Colors.deepOrange;

  MessageButton({this.margin = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(5, margin, 0, margin),
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                shape: SharpButtonShape.sharpCorners(),
                side: BorderSide(width: 1.0, color: primaryColor)),
            onPressed: () {
              print("User pressed [message] button");
            },
            child: Row(children: [
              Icon(Icons.mail_outlined, color: primaryColor),
              Text("Message", style: TextStyle(color: primaryColor))
            ])));
  }
}