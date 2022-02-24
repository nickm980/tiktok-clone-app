import 'dart:async';

class EventBus {
  static EventBus bus = EventBus();

  StreamController _streamController;

  StreamController get streamController => _streamController;

  EventBus({bool sync = false})
      : _streamController = StreamController.broadcast(sync: sync);

  EventBus.customController(StreamController controller)
      : _streamController = controller;

  Stream<T> on<T>() {
    if (T == dynamic) {
      return streamController.stream as Stream<T>;
    } else {
      return streamController.stream.where((event) => event is T).cast<T>();
    }
  }

  void fire(EventHandler event) {
    streamController.add(event);
  }

  void destroy() {
    _streamController.close();
  }

  static EventBus getEventBus(){
    return bus;
  }
}

class EventHandler {
}