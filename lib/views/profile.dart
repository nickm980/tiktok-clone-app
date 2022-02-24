import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/views/settings.dart';
import 'package:social/widgets/buttons/button.dart';
import 'package:social/navigation.dart';
import 'package:social/widgets/post/post.dart';

import '../numbers.dart';
import '../widgets/buttons/profile_buttons.dart';
import '../widgets/post/post_images.dart';
import '../widgets/profile/profile_listing.dart';
import '../widgets/profile/user_stats.dart';

const placeholderImage =
    "https://static.vecteezy.com/packs/media/components/global/search-explore-nav/img/vectors/term-bg-1-666de2d941529c25aa511dc18d727160.jpg";

class ProfileNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("A"),
        IconButton(
            onPressed: () {
              PageManager.changePage(Settings(), context);
            },
            icon: Icon(Icons.menu, size: 30)),
      ],
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var profileImage = Container(
        child: Column(children: [
      CircleAvatar(
        radius: 48, // Image radius
        backgroundImage: NetworkImage(placeholderImage),
        backgroundColor: Colors.grey,
      )
    ]));
    var profileNavigation = Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Text("Hello"),
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.red,
      )),
    );

    var topHalf = [
      ProfileNavigationBar(),
      profileImage,
      Container(
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Text("@profilename")),
      UserStats(margin: 20),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [FollowButton(margin: 15), MessageButton(margin: 15)]),
      profileNavigation,
    ];

    return ProfileListing(topHalf);
  }
}
