import 'package:flutter/cupertino.dart';
import 'package:social/widgets/profile/content_list.dart';

import '../widgets/post/post.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return FeedListing(constraints.maxWidth, constraints.maxHeight);
    });
  }
}
