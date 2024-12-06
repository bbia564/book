import 'package:book_cover/db_book/book_entity.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../db_book/db_book.dart';

class BookContentAddLogic extends GetxController {

  DBBook dbBook = Get.find<DBBook>();

  BookEntity bookEntity = Get.arguments;
  int index = -1;

  String title = '';
  String content = '';

  void addBookContent() async {
    if (title.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter title');
      return;
    }
    if (content.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter content');
      return;
    }
    BookContent entity = BookContent(
      createdTime: DateTime.now(),
      title: title,
      content: content,
    );
    bookEntity.list.add(entity);
    await dbBook.updateBook(bookEntity);
    Get.back(result: bookEntity);
  }

  void updateBookContent() async {
    if (title.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter title');
      return;
    }
    if (content.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter content');
      return;
    }
    BookContent entity = BookContent(
      createdTime: DateTime.now(),
      title: title,
      content: content,
    );
    bookEntity.list[index] = entity;
    await dbBook.updateBook(bookEntity);
    Get.back(result: bookEntity);
  }

  void deleteBookContent() async {
    bookEntity.list.removeAt(index);
    await dbBook.updateBook(bookEntity);
    Get.back(result: bookEntity);
  }

  void copyBookContent() {
    if (content.isEmpty) {
      return;
    }
    ClipboardData data = ClipboardData(text: content);
    Clipboard.setData(data);
    Fluttertoast.showToast(msg: 'Copied');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    final inx = Get.parameters['index'];
    if (inx != null) {
      index = int.parse(inx);
    }
    if (index != -1) {
      title = bookEntity.list[index].title;
      content = bookEntity.list[index].content;
    }
    update();
    super.onInit();
  }

}
