import 'package:get/get.dart';

import 'book_third_logic.dart';

class BookThirdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookThirdLogic());
  }
}
