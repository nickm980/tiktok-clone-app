import 'event_bus.dart';
import 'events.dart';
import 'models/post_models.dart';

void registerLikeAndUnlikeListeners(
    Function onLikeEvent, Function onUnlikeEvent, PostId id) {
  EventBus eventBus = EventBus.getEventBus();

  eventBus.on<LikePostEvent>().listen((event) {
    if (event.getButtonId() != id.getId()) {
      return;
    }
    onLikeEvent(event);
  });

  eventBus.on<UnlikePostEvent>().listen((event) {
    if (event.getButtonId() != id.getId()) {
      return;
    }
    onUnlikeEvent(event);
  });
}
