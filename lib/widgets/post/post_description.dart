import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const textColor = Colors.white;
const tagColor = Colors.white;

class Description extends StatelessWidget {
  List<String> tags;
  String description;

  Description({required this.description, required this.tags});

  @override
  Widget build(BuildContext context) {
    List<Widget> prefixedTags = [];

    for (var v in tags) {
      Widget tag = Text("#" + v, style: TextStyle(color: tagColor, fontWeight: FontWeight.bold));
      prefixedTags.add(tag);
    }

    return Positioned(
        left: 20,
        bottom: 20,
        child: Container(
            width: MediaQuery.of(context).size.width - 100,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(description, style: TextStyle(color: textColor)),
              Row(children: prefixedTags)
            ])));
  }
}
