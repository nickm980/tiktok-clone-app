import 'package:flutter/cupertino.dart';

import '../widgets/like_animation.dart';

class Camera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LikeAnimation(onPress: () { print("hi"); }, child: Text("child"),);
  }
}
