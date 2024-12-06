import 'package:book_cover/db_book/db_book.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../db_book/book_entity.dart';

class NoteAddLogic extends GetxController {

  DBBook dbBook = Get.find<DBBook>();

  NoteEntity? noteEntity = Get.arguments;

  String title = '';
  String content = '';

  void addNote() async {
    if (title.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter title');
      return;
    }
    if (content.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter content');
      return;
    }
    NoteEntity entity = NoteEntity(
      id: 0,
      createdTime: DateTime.now(),
      title: title,
      content: content,
    );
    await dbBook.insertNote(entity);
    Get.back();
  }

  void updateNote(NoteEntity entity) async {
    if (title.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter title');
      return;
    }
    if (content.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter content');
      return;
    }
    entity.title = title;
    entity.content = content;
    await dbBook.updateNote(entity);
    Get.back();
  }

  void deleteNote(int id) async {
    await dbBook.deleteNote(id);
    Get.back();
  }

  void copyNote() {
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
    if (noteEntity != null) {
      title = noteEntity!.title;
      content = noteEntity!.content;
    }
    update();
    super.onInit();
  }

}
