import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/like_button_listeners.dart';
import 'package:social/views/comments.dart';
import 'package:social/navigation.dart';

import '../../controller/feed_controller.dart';
import '../../event_bus.dart';
import '../../events.dart';
import '../../models/post_models.dart';
import '../../numbers.dart';

class ToggableButton extends StatefulWidget {
  final Widget child;
  final bool? outline;

  const ToggableButton({Key? key, this.outline, required this.child})
      : super(key: key);

  @override
  State<ToggableButton> createState() {
    return _ButtonState();
  }
}

class _ButtonState extends State<ToggableButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          shape: fromAll(SharpButtonShape.sharpCorners()),
          backgroundColor: fromAll(Colors.orange),
          foregroundColor: fromAll(Colors.white),
          padding: fromAll(const EdgeInsets.fromLTRB(20, 10, 20, 10))),
      onPressed: () {},
      child: widget.child,
    );
  }
}

class SharpButtonShape {
  static RoundedRectangleBorder sharpCorners() {
    return const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(0),
            topLeft: Radius.circular(0),
            bottomRight: Radius.circular(0)));
  }
}

class ActionItem extends StatelessWidget {
  IconData icon;
  Color color;
  String data;
  double size;
  Function() onTap;

  ActionItem(
      {required this.onTap,
      required this.icon,
      required this.color,
      required this.data,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Column(children: [
              IconButton(
                  onPressed: onTap, icon: Icon(icon, size: size, color: color)),
              Text(data, style: TextStyle(color: color))
            ])));
  }
}

MaterialStateProperty<T> fromAll<T>(T any) {
  return MaterialStateProperty.all(any);
}
