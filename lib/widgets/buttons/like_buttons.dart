import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../controller/feed_controller.dart';
import '../../event_bus.dart';
import '../../events.dart';
import '../../like_button_listeners.dart';
import '../../models/post_models.dart';
import '../../numbers.dart';
import 'button.dart';

class LikeButtonState extends State<LikeButton> {
  Color color = Colors.white;
  bool liked = false;
  int likes = 10;
  bool listening = false;

  void onLikeEvent(LikePostEvent e) {
    print("liked POST");

    setState(() {
      color = Colors.deepOrangeAccent;
      liked = true;
      likes ++;
    });
  }

  void onUnlikeEvent(UnlikePostEvent e) {
    print("unliked POST");
    setState(() {
      color = Colors.white;
      liked = false;
      likes--;
    });
  }

  void _onTap(BuildContext context) {
    EventBus eventBus = EventBus.getEventBus();
    if (!liked) {
      eventBus.fire(LikePostEvent(buttonId: widget.id.getId()));
    }
    else {
      eventBus.fire(UnlikePostEvent(buttonId: widget.id.getId()));
    }
  }

  @override
  void initState() {
    super.initState();
    if (!listening) {
      listening = true;
      registerLikeAndUnlikeListeners(onLikeEvent, onUnlikeEvent, widget.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ActionItem(
      size: widget.size,
      data: Numbers.condenseNumber(likes),
      icon: Icons.thumb_up,
      color: color,
      onTap: () {
        _onTap(context);
      },
    );
  }
}

class LikeButton extends StatefulWidget {
  PostModel postModel;
  bool liked = false;
  double size;
  PostId id;

  LikeButton({required this.size, required this.postModel, required this.id });

  @override
  State<StatefulWidget> createState() {
    return LikeButtonState();
  }
}