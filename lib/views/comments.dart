import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/models/post_models.dart';
import 'package:social/views/profile.dart';

import '../navigation.dart';

class Comments extends StatelessWidget {
  PostId parentPostId;

  Comments(this.parentPostId);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            )),
        child: IconButton(
          icon: Icon(Icons.arrow_back_rounded, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        alignment: Alignment.centerLeft,
      ),
      Expanded(child: ListView.builder(
        itemCount: 10,
        itemBuilder: (builder, context) {
          return CommentBlock("name");
        },
      )),
      Container(
          child: TextField(
            onSubmitted: (var s) => {print("Subbmiteed comment" + s)},
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Add a Comment',
            ),
          ))
    ]);
  }
}

var placeholder =
    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";

class _NameCommentAndActionBar extends StatelessWidget {
  String name;
  String comment;

  _NameCommentAndActionBar(this.name, this.comment);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _AuthorLink("hello "),
      Wrap(children: [
        _PaddedElement(10, Text("Bj;lajdfkal;dfasdf")),
      ]),
      _PaddedElement(
          10,
          Row(
            children: [
              Icon(Icons.thumb_up_sharp, size: 15),
              Text(" 20  "),
              Text(
                "Reply",
                style: TextStyle(color: Colors.black38),
              )
            ],
          )),
      _PaddedElement(
          10,
          Row(
            children: [
              Text("- View Replies (57) "),
              Icon(Icons.arrow_drop_down)
            ],
          )),
    ]);
  }
}

class _AuthorLink extends StatelessWidget {
  String name;

  _AuthorLink(this.name);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          PageManager.changePage(Profile(), context);
        },
        child: Text(
          name,
          style: TextStyle(color: Colors.black38),
        ));
  }
}

class _MoreComments extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}

class _MoreCommentsState extends State<_MoreComments> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _PaddedElement extends StatelessWidget {
  double padding;
  Widget child;

  _PaddedElement(this.padding, this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, padding, 0, 0), child: child);
  }
}

class CommentBlock extends StatelessWidget {
  String userName;

  CommentBlock(this.userName);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: CircleAvatar(backgroundColor: Colors.orange, radius: 15)),
          //.
          _NameCommentAndActionBar("name", "comment"),
          //.
          Spacer(),
          //.
          Icon(Icons.more_horiz_outlined),
        ]),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        width: MediaQuery
            .of(context)
            .size
            .width);
  }
}
