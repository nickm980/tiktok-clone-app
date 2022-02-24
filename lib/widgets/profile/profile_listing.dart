import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/views/feed.dart';
import 'package:social/widgets/loaders.dart';
import 'package:social/widgets/profile/user_stats.dart';

import '../../controller/feed_controller.dart';
import '../buttons/profile_buttons.dart';
import '../post/post.dart';
import '../post/post_images.dart';

const placeholderImage =
    "https://static.vecteezy.com/packs/media/components/global/search-explore-nav/img/vectors/term-bg-1-666de2d941529c25aa511dc18d727160.jpg";

class ProfileListing extends StatefulWidget {
  List<Widget> children;

  ProfileListing(this.children);

  @override
  State<StatefulWidget> createState() {
    return _ProifleState();
  }
}

class _ProifleState extends State<ProfileListing> {
  List<PostModel> posts = [];
  final ScrollController _scrollController = ScrollController();
  bool loading = false;

  fetchPosts(int amount) async {
    //Prevent duplicate requests
    if (loading) {
      return;
    }
    setState(() {
      loading = true;
    });
    var postController = PostController();
    List<PostModel> addedPosts = await postController.fetchPosts(amount);

    if (!mounted) {
      return;
    }

    setState(() {
      posts.addAll(addedPosts);
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchPosts(9);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        fetchPosts(3);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double padding = 5;
    var postWidth = MediaQuery.of(context).size.width / 3 - padding;

    List<Widget> postWidgets = [];

    for (var postModel in posts) {
      postWidgets.add(PostThumbnail(postWidth));
    }

    var loader = Visibility(visible: loading, child: ProfileLoader());

    return Column(children: [
      Expanded(
          child: ListView(
              physics: BouncingScrollPhysics(),
              controller: _scrollController,
              children: [
            ...widget.children,
            Wrap(
                alignment: WrapAlignment.start,
                spacing: padding,
                runSpacing: padding,
                children: postWidgets),
            loader
          ]))
    ]);
  }
}
