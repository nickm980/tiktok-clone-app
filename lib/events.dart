import 'package:flutter/cupertino.dart';

import 'event_bus.dart';

class PageChangeEvent extends Notification {
  Widget? currentPage;
  bool full = true;
  bool goBack = false;

  PageChangeEvent({this.currentPage});

  static PageChangeEvent fromBack() {
    PageChangeEvent changeEvent = PageChangeEvent();
    changeEvent.setBack(true);

    return changeEvent;
  }

  static PageChangeEvent fromPopup(Widget widget) {
    PageChangeEvent changeEvent = PageChangeEvent(currentPage: widget);
    changeEvent.setFullPage(false);

    return changeEvent;
  }

  void setFullPage(bool fullPage) {
    this.full = fullPage;
  }

  bool getFullPage() {
    return full;
  }

  void setBack(bool goBack) {
    this.goBack = goBack;
  }

  bool getGoBack() {
    return goBack;
  }

  getNewPage() {
    return currentPage;
  }
}

class LikePostEvent extends EventHandler {
  UniqueKey buttonId;

  LikePostEvent({required this.buttonId});

  UniqueKey getButtonId() {
    return buttonId;
  }
}

class UnlikePostEvent extends EventHandler {
  UniqueKey buttonId;

  UnlikePostEvent({required this.buttonId});

  UniqueKey getButtonId() {
    return buttonId;
  }
}
