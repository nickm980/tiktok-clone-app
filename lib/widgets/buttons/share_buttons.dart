import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'button.dart';

var subIconUrl =
    "https://cdn.pixabay.com/photo/2018/11/13/22/02/instagram-3814092_960_720.png";

class ShareButton extends StatelessWidget {
  void _openPopUp(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            height: 200,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(spacing: 10, children: [
                  ShareSubIcon(
                    label: "Email",
                    icon: Icons.email,
                    onPressed: () {
                      print("Shared");
                    },
                  ),
                  ShareSubIcon(
                    label: "Other",
                    icon: Icons.more_horiz,
                    backgroundColor: Colors.green,
                    onPressed: () {
                      Share.share("other");
                    },
                  ),
                ])));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ActionItem(
        icon: Icons.send_outlined,
        size: 30,
        data: "Share",
        color: Colors.white,
        onTap: () {
          _openPopUp(context);
        });
  }
}

class ShareSubIcon extends StatefulWidget {
  IconData icon;
  Color iconColor, backgroundColor;
  Function() onPressed;
  String label;

  ShareSubIcon({required this.icon,
    this.iconColor = Colors.white,
    this.backgroundColor = Colors.red,
    required this.onPressed,
    required this.label});

  @override
  State<StatefulWidget> createState() {
    return ShareSubIconState();
  }
}

class ShareSubIconState extends State<ShareSubIcon> {

  void onTap() {
    setState(() {
      widget.backgroundColor = widget.backgroundColor.withOpacity(0);
    });

    widget.onPressed();
  }

  void onTapCancel() {
    setState(() {
      widget.backgroundColor = Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
          onTapCancel: onTapCancel,
          onTap: onTap,
          child: Container(
            width: 50,
            height: 50,
            decoration: ShapeDecoration(
                shape: CircleBorder(), //here we set the circular figure
                color: widget.backgroundColor),
            child: Center(
                child: Icon(
                  widget.icon,
                  size: 30,
                  color: Colors.white,
                )),
          )),
      Text(widget.label),
    ]);
  }
}
