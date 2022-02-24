import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _LikePainter extends CustomPainter {
  final Animation<double> _animation;

  _LikePainter(this._animation) : super(repaint: _animation);

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(0, 0), size.width, Paint());
  }
}

class LikeAnimation extends StatefulWidget {
  final Widget child;
  final VoidCallback onPress;

  LikeAnimation({required this.child, Key? key, required this.onPress})
      : assert(child != null),
        super(key: key);

  @override
  _LikeAnimationState createState() => _LikeAnimationState();
}

class _LikeAnimationState extends State<LikeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> scale;
  bool playing = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (builder, context) {
          return Listener(
            onPointerDown: (PointerDownEvent event) {
              _controller.forward();
            },
            onPointerUp: (PointerUpEvent event) {
              _controller.reverse();
              if (widget.onPress == null) return;
              widget.onPress();
            },
            child: ScaleTransition(
              scale: scale,
              child: widget.child,
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
    scale = Tween<double>(begin: 1.0, end: 0.9)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.stop();
    _controller.reset();
    _controller.repeat(
      period: Duration(seconds: 1),
    );
  }
}
