import 'package:book_cover/db_book/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../db_book/db_book.dart';
import '../../book_third/feedback/book_text_field.dart';

class BookContentListLogic extends GetxController {

  DBBook dbBook = Get.find<DBBook>();

  BookEntity entity = Get.arguments;

  void deleteBook() async {
    await dbBook.deleteBook(entity.id);
    Get.back();
  }

  void updateBookName() async {
    String name = entity.name;
    Get.dialog(AlertDialog(
      title: const Text(
        'Book cover',
        textAlign: TextAlign.center,
      ),
      content: Container(
        width: double.infinity,
        height: 50,
        child: BookTextField(
            value: name,
            hintText: 'Name',
            maxLength: 12,
            onChange: (value) {
              name = value;
            }),
      ).decorated(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey)),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () async {
            if (name.isEmpty) {
              Fluttertoast.showToast(msg: 'Please enter the name');
              return;
            }
            entity.name = name;
            update();
            await dbBook.updateBook(BookEntity(
                id: entity.id,
                createdTime: entity.createdTime,
                name: name,
                list: entity.list));
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }

}
