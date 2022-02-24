import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/widgets/post/post.dart';

import '../widgets/post/post_images.dart';

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      HeaderSlides(),
      HorizontalList(marginTop: 30, hashTag: "Hello"),
      HorizontalList(marginTop: 30, hashTag: "asdf"),
      HorizontalList(marginTop: 30, hashTag: "aasdf")
    ]);
  }
}

class Account extends StatelessWidget {
  String name;
  Image image;

  Account(this.name, this.image);

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class HeaderSlides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(width: width, height: width / 2, decoration: BoxDecoration(color: Colors.orange),);
  }
}

class HorizontalList extends StatelessWidget {
  double? marginTop;
  String hashTag;

  HorizontalList({this.marginTop, required this.hashTag}) {
    marginTop ??= 0;
  }

  @override
  Widget build(BuildContext context) {
    double height = 120;
    double width = (height / 1.5);

    return Column(children: <Widget>[
      Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.green)),
          margin: EdgeInsets.fromLTRB(0, marginTop!, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text(hashTag)),
      Container(
        height: height,
        width: double.infinity,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            itemBuilder: (BuildContext context, int index) => Container(
                padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                child: PostThumbnail(width))),
      )
    ]);
  }
}
