import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/views/camera.dart';
import 'package:social/widgets/responsive_safe_area.dart';

import 'events.dart';
import 'views/explore.dart';
import 'views/feed.dart';
import 'views/inbox.dart';
import 'views/profile.dart';
import 'widgets/navbar.dart';

final views = [
  NavView(path: "/feed", widget: Feed(), icon: Icons.home, label: "Feed"),
  NavView(path: "/explore", widget: Explore(), icon: Icons.search, label: "Explore"),
  NavView(
      path: "/create", widget: Camera(), icon: Icons.add_box_outlined, label: "Create"),

  NavView(path: "/inbox", widget: Inbox(), icon: Icons.message_outlined, label: "Inbox"),
  NavView(path: "/profile", widget: Profile(), icon: Icons.person, label: "Profile"),
];

class View {
  final Widget widget;
  final String path;

  View(this.path, this.widget);

  Widget getWidget() {
    return widget;
  }

  String getPath() {
    return path;
  }
}

class NavView extends View {
  final IconData icon;
  final String label;

  NavView({required String path, required Widget widget, required this.icon, required this.label})
      : super(path, widget);

  IconData getIconData() {
    return icon;
  }

  String getLabel() {
    return label;
  }
}

class History {
  Widget widget;
  int index;

  History({required this.index, required this.widget});

  Widget getWidget() {
    return widget;
  }

  int getIndex() {
    return index;
  }
}

class NavigationState extends State<CustomNavigationBar> {
  int _index = 0;
  Widget currentPage = views[0].getWidget();
  List<History> history = [History(index: 0, widget: views[0].getWidget())];

  Future<bool> _onWillPop() async {
    if (_index == 0 && history.length <= 1) {
      return true;
    } else {
      history.remove(history.last);
      setState(() {
        _index = history.last.getIndex();
        currentPage = history.last.getWidget();
      });

      return false;
    }
  }

  void _onItemTapped(int index) {
    Widget w = views[index].getWidget();
    _addHistory(index, w);

    setState(() {
      currentPage = w;
      _index = index;
    });
  }

  void _addHistory(int index, Widget w) {
    if (history.length > 5) {
      history.remove(history[1]);
    }
    history.add(History(index: index, widget: w));
  }

  bool onPageChange(PageChangeEvent e) {
    if (e.getGoBack()) {
      history.remove(history.last);
      setState(() {
        currentPage = history.last.getWidget();
        _index = history.last.getIndex();
      });
      return true;
    }

    if (!e.getFullPage()) {
      print("popup pressed");
      var popup = Positioned(
          child: AnimatedSlide(
            child: Icon(Icons.thumb_up, size: 40),
            duration: Duration(seconds: 10),
            offset: Offset(0, 0),
          ),
          bottom: 0);
      setState(() {
        currentPage = Stack(children: [currentPage, popup]);
      });

      _addHistory(_index, currentPage);
      return true;
    }

    setState(() {
      currentPage = e.getNewPage();
    });
    _addHistory(_index, e.getNewPage());
    return true;
  }

  @override
  Widget build(BuildContext context) {
    Widget mainView = NotificationListener<PageChangeEvent>(
        onNotification: onPageChange,
        child: WillPopScope(
            onWillPop: _onWillPop,
            child: Scaffold(
                body: SafeArea(child: currentPage),
                bottomNavigationBar: CustomBottomNavigation(_index, _onItemTapped))));

    if (_index == 0) {
      return SafeArea(child: mainView);
    }

    return mainView;
  }
}

class CustomNavigationBar extends StatefulWidget {
  CustomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomNavigationBar> createState() {
    return NavigationState();
  }
}

class PageManager {
  static void changePage(Widget newPage, BuildContext context) {
    PageChangeEvent(currentPage: newPage).dispatch(context);
  }

  static goBack(BuildContext context) {
    PageChangeEvent.fromBack().dispatch(context);
  }

  static void showPopup(Widget widget, BuildContext context) {
    PageChangeEvent.fromPopup(widget).dispatch(context);
  }
}

// if (_index == 0) {
//   return SafeArea(child: Scaffold(
//     bottomNavigationBar: bottomNav,
//     // The Builder widget is no longer needed
//     body: ResponsiveSafeArea(
//       builder: (context, size) {
//         double height = MediaQuery.of(context).size.height - kToolbarHeight -
//             MediaQuery.of(context).padding.top -
//             MediaQuery.of(context).padding.bottom;
//         this.height = height;
//         print(size.height);
//         return Container(
//           decoration: BoxDecoration(color: Colors.green.shade200),
//           alignment: Alignment.topCenter,
//           height: size.height,
//           child: views[_index].getWidget(),
//         );
//       },
//     ),
//   ));
// } else {
