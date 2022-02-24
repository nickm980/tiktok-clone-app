import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../navigation.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = [
      FullScreenVideoPost(),
    ];

    return HomeContainer(child: Column(children: [Text("a")]));
  }
}

class HomeContainer extends StatelessWidget {
  final Widget child;

  const HomeContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomNavigationBar();
  }
}

class FullScreenVideoPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://cdn.pixabay.com/photo/2017/02/21/21/13/unicorn-2087450_1280.png",
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }
}