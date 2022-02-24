import 'package:flutter/cupertino.dart';

class PostId {
  late UniqueKey id;

  PostId(){
    id = UniqueKey();
  }

  UniqueKey getId(){
    return id;
  }
}