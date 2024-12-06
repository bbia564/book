import 'package:get/get.dart';

import 'book_content_add_logic.dart';

class BookContentAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookContentAddLogic());
  }
}
