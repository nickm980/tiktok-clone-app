import 'package:flutter/cupertino.dart';

class Messenger extends StatelessWidget {
  String name;

  Messenger({required this.name});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(children: [Text("Message")],)
    );
  }
}

class MessageBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

}