import 'package:get/get.dart';

import 'book_four_logic.dart';

class BookFourBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
