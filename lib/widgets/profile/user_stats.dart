import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../numbers.dart';

class UserStats extends StatelessWidget {
  double margin;

  UserStats({this.margin = 0});

  @override
  Widget build(BuildContext context) {
    double width = 100;
    return Container(
        margin: EdgeInsets.fromLTRB(0, margin, 0, 0),
        child: Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              UserMeta(1200, "Likes", width),
              UserMeta(2, "Followers", width),
              UserMeta(2, "Following", width)
            ])));
  }
}

class UserMeta extends StatelessWidget {
  int amount;
  double width;
  String label;

  UserMeta(this.amount, this.label, this.width);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        child: Column(children: [
          Text(Numbers.condenseNumber(amount),
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          )
        ]));
  }
}