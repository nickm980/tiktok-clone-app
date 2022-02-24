import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/post_models.dart';
import '../../views/comments.dart';
import 'button.dart';
import '../../navigation.dart';

class CommentButton extends StatelessWidget {
  double size;
  Color color;
  PostId parentPostId;

  CommentButton(
      {required this.size, required this.color, required this.parentPostId});

  void _openPopUp(context) {
    showModalBottomSheet(
        isDismissible: true,
        isScrollControlled: false,
        context: context, builder: (builder) {
      return Comments(parentPostId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ActionItem(
        icon: Icons.comment_outlined,
        size: size,
        color: color,
        data: 'NaN',
        onTap: () {
          _openPopUp(context);
        });
  }
}
