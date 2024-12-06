import 'package:get/get.dart';

import 'note_add_logic.dart';

class NoteAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NoteAddLogic());
  }
}
