
import 'package:book_cover/pages/book_third/book_third_logic.dart';
import 'package:get/get.dart';

import '../book_first/book_first_logic.dart';
import '../book_second/book_second_logic.dart';
import 'book_tab_logic.dart';

class BookTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookTabLogic());
    Get.lazyPut(() => BookFirstLogic());
    Get.lazyPut(() => BookSecondLogic());
    Get.lazyPut(() => BookThirdLogic());
  }
}
