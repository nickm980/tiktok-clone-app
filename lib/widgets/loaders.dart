import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:social/widgets/post/post.dart';

class ProfileLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var loader = SpinKitThreeBounce(
      color: Colors.black12,
      size: 20.0,
    );

    return Container(margin: EdgeInsets.fromLTRB(0, 20, 0, 20), child: loader);
  }
}

class PostLoader extends StatelessWidget {
  double width, height;

  PostLoader({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    var loader = SpinKitThreeBounce(color: Colors.white, size: 25);
    return Container(
      child: loader,
      color: Colors.black,
      width: width,
      height: height,
    );
  }
}
