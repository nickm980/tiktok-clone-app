import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../navigation.dart';

class CustomBottomNavigation extends StatelessWidget {
  var onTap;
  int index;

  CustomBottomNavigation(this.index, this.onTap, {Key? key}) : super(key: key);

  List<BottomNavigationBarItem> _generateNavBarItems(List<View> views) {
    List<BottomNavigationBarItem> items = [];

    for (var view in views) {
      if (view is NavView) {
        items.add(BottomNavigationBarItem(icon: Icon(view.getIconData()), label: view.getLabel()));
      }
    }
    if (items.isEmpty) {
      throw Exception("The navbar cannot be empty");
    }
    return items;
  }

  BottomNavigationBar _createNavBar() {
    List<BottomNavigationBarItem> items = _generateNavBarItems(views);

    var selectedItemColor = Colors.black;
    var unselectedItemColor = Colors.grey[400];
    var navBackground = Colors.white;

    if (index == 0) {
      navBackground = Colors.black;
      selectedItemColor = Colors.white;
      unselectedItemColor = Colors.grey[500];
    }

    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: items,
        currentIndex: index,
        backgroundColor: navBackground,
        selectedItemColor: selectedItemColor,
        unselectedItemColor: unselectedItemColor,
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        selectedFontSize: 12,
        onTap: onTap);
  }

  @override
  Widget build(BuildContext context) {
    return _createNavBar();
  }
}

class CustomTopNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}