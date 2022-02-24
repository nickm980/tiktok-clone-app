import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:social/views/feed.dart';

import '../../controller/feed_controller.dart';
import '../loaders.dart';
import '../post/post.dart';

const placeholderImage =
    "https://static.vecteezy.com/packs/media/components/global/search-explore-nav/img/vectors/term-bg-1-666de2d941529c25aa511dc18d727160.jpg";
const amountToFetch = 10;

class FeedListing extends StatefulWidget {
  double width, height;

  FeedListing(this.width, this.height);

  @override
  State<StatefulWidget> createState() {
    return _ContentState();
  }
}

class _ContentState extends State<FeedListing> {
  List<PostModel> posts = [];
  final ScrollController _scrollController = ScrollController();
  bool loading = false;

  fetchPosts() async {
    //prevent duplicate fetches
    if (loading) {
      return;
    }
    setState(() {
      loading = true;
    });

    var postController = PostController();
    List<PostModel> addedPosts = await postController.fetchPosts(5);

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
    fetchPosts();
    _scrollController.addListener(() {
      if(_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        print("foward");
      }
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        print(_scrollController.position.maxScrollExtent);
        fetchPosts();
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
    List<Widget> postWidgets = [];

    for (var postModel in posts) {
      postWidgets.add(Post(Image.network(placeholderImage), "Description",
          widget.width, widget.height));
    }

    if (loading) {
      postWidgets.add(PostLoader(width: widget.width, height: widget.height));
    }

    return ListView(
        physics: PageScrollPhysics(),
        controller: _scrollController,
        children: postWidgets);
  }
}
