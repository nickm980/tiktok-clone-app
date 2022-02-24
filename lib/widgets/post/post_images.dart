import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/post_models.dart';
import '../../navigation.dart';
import 'post.dart';

class PostImage extends StatefulWidget {
  double width, height;
  PostId postId;

  PostImage(this.width, this.height, this.postId);

  @override
  State<StatefulWidget> createState() {
    return PostImageState();
  }
}

class PostImageState extends State<PostImage> {
  bool paused = false;
  Widget overlay = Text("a");
  bool liked = false;

  void _pauseOrPlayVideo() {
    if (paused) {
      print("Video playing");
      //play video
    } else {
      print("Video paused");
      //pause video
    }

    paused = !paused;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var image = FittedImage(
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
        widget.width,
        widget.height);

    //pause video
    return GestureDetector(onTap: _pauseOrPlayVideo, child: image);
  }
}

class PostThumbnail extends StatelessWidget {
  final double size;

  PostThumbnail(this.size);

  @override
  Widget build(BuildContext context) {
    return PhotoHero(
        child: Stack(children: [
          FittedImage(placeholderImage, size, size * 1.5),
          Positioned(
              left: 0,
              bottom: 0,
              child: Row(children: [
                Icon(
                  Icons.play_arrow_outlined,
                  color: Colors.white,
                ),
                Text("1,000",
                    style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
              ])),
        ]));
  }
}

class PhotoHero extends StatelessWidget {
  const PhotoHero({Key? key, required this.child}) : super(key: key);

  final Widget child;

  Widget build(BuildContext context) {
    return InkWell(
      child: child,
      onTap: () => _gotoDetailsPage(context),
    );
  }

  void _gotoDetailsPage(BuildContext context) {
    PageManager.changePage(Text("a"), context);
  }
}

class FittedImage extends StatelessWidget {
  String imageUrl;
  double width;
  double height;

  FittedImage(this.imageUrl, this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(placeholderImage),
            fit: BoxFit.cover,
          ),
        ));
  }
}