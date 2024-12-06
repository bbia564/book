import 'package:get/get.dart';

import 'book_first_logic.dart';

class BookFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookFirstLogic());
  }
}
