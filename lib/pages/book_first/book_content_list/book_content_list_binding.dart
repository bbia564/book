import 'package:get/get.dart';

import 'book_content_list_logic.dart';

class BookContentListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookContentListLogic());
  }
}
