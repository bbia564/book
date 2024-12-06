import 'package:book_cover/db_book/book_entity.dart';
import 'package:book_cover/pages/book_third/feedback/book_text_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../db_book/db_book.dart';

class BookFirstLogic extends GetxController {
  DBBook dbBook = Get.find<DBBook>();

  var list = <BookEntity>[].obs;

  void getData() async {
    list.value = await dbBook.getBookAllData();
  }

  void addBook() async {
    String name = '';
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
            await dbBook.insertBook(BookEntity(
                id: 0,
                createdTime: DateTime.now(),
                name: name,
                list: []));
            getData();
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

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }
}
