import 'package:book_cover/db_book/db_book.dart';
import 'package:get/get.dart';

import '../../db_book/book_entity.dart';

class BookSecondLogic extends GetxController {

  DBBook dbBook = Get.find<DBBook>();

  var list = <NoteEntity>[].obs;

  void getData() async {
    list.value = await dbBook.getNoteAllData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
