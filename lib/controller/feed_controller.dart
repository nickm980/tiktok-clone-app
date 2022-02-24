import 'package:flutter/material.dart';

List<PostModel> cachedPosts = [];

class FeedModel {
  List<PostModel> getNextTenPosts() {
    return [PostModel(20, 20, true), PostModel(20, 20, true)];
  }
}

class PostModel {
  late int likes;
  late int comments;
  bool userHasLiked;

  PostModel(this.likes, this.comments, this.userHasLiked);
}

class PostController {

  Future<List<PostModel>> fetchPosts(int amount) async {
    List<PostModel> posts = [];

    for (int i = 0; i < amount; i++) {
      posts.add(PostModel(20, 20, true));
    }
    await Future.delayed(Duration(seconds: 1));

    return posts;
  }
}