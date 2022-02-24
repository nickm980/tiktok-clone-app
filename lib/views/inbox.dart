import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/views/messenger.dart';

import '../widgets/like_animation.dart';
import '../widgets/loaders.dart';

class Inbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("inbox");
  }
}

class LikeAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LikeState();
  }
}

class LikeState extends State<LikeAnimation>
    with TickerProviderStateMixin {

  late AnimationController controller;
  late Animation tween;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    tween = IntTween(begin: 25, end: 500).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward().then((value) => controller.reverse());

    var animationWidget = AnimatedBuilder(
        animation: tween,
        builder: (builder, child) {
          return Icon(Icons.favorite, size: tween.value + 0.0);
        });

    return animationWidget;
  }
}
