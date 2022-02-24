import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text("Account Settings"),
        SettingsBar(onClick: () { print("a"); },),
        SettingsBar(onClick: () { print("a"); },),
        SettingsBar(onClick: () { print("a"); },),
        Text("Feed Settings"),
        SettingsBar(onClick: () { print("a"); },),
        Text("Legal"),
        SettingsBar(onClick: () { print("a"); },),
      ],
    );
  }
}

class SettingsBar extends StatefulWidget {
  Function onClick;

  SettingsBar({required this.onClick});

  @override
  State<StatefulWidget> createState() {
    return _SettingsBarState();
  }

}

class _SettingsBarState extends State<SettingsBar> {

  void onPressed(){
    widget.onClick();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Row(children: [Text("hello")]));
  }

}

