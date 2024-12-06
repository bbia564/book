import 'package:get/get.dart';

import 'book_second_logic.dart';

class BookSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookSecondLogic());
  }
}
