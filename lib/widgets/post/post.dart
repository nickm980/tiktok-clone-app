import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/widgets/buttons/button.dart';
import 'package:social/widgets/buttons/share_buttons.dart';
import 'package:social/widgets/post/post_description.dart';
import 'package:social/widgets/post/post_images.dart';

import '../../controller/feed_controller.dart';
import '../../models/post_models.dart';
import '../buttons/comment_button.dart';
import '../buttons/like_buttons.dart';
import '../../navigation.dart';

const placeholderImage =
    "https://static.vecteezy.com/packs/media/components/global/search-explore-nav/img/vectors/term-bg-1-666de2d941529c25aa511dc18d727160.jpg";

class Post extends StatelessWidget {
  Image image;
  String description;
  double width, height;

  Post(this.image, this.description, this.width, this.height, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostId post = PostId();

    return Center(
        child: Stack(children: [
      PostImage(width, height, post),
      Positioned(child: ActionsRow(20, 20), bottom: 30, right: 20),
      Description(
          description:
              "This is a description of a post. It can be up to two lines long",
          tags: ["learning"])
    ]));
  }
}

class ActionsRow extends StatelessWidget {
  final int likes;
  final int messages;

  ActionsRow(this.likes, this.messages);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      LikeButton(
        postModel: PostModel(20, 20, false),
        size: 30,
        id: PostId(),
      ),
      CommentButton(color: Colors.white, parentPostId: PostId(), size: 30),
      ShareButton()
    ]);
  }
}
