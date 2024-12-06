import 'package:book_cover/pages/book_third/feedback/book_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'note_add_logic.dart';

class NoteAddPage extends GetView<NoteAddLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.noteEntity == null ? 'Add' : 'Edit',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [
          const Text(
            'Commit',
            style: TextStyle(color: Colors.white),
          ).marginOnly(right: 20).gestures(onTap: () {
            if (controller.noteEntity == null) {
              controller.addNote();
            } else {
              controller.updateNote(controller.noteEntity!);
            }
          })
        ],
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(15),
        child: <Widget>[
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: BookTextField(
                        hintText: 'Title',
                        maxLength: 12,
                        value: controller.title,
                        onChange: (value) {
                          controller.title = value;
                        }),
                  ),
                  Divider(height: 30,color: Colors.grey[200],),
                  SizedBox(
                    width: double.infinity,
                    child: BookTextField(
                        hintText: 'Content',
                        maxLength: 500,
                        maxLines: 10,
                        value: controller.content,
                        onChange: (value) {
                          controller.content = value;
                        }),
                  )
                ].toColumn(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          <Widget>[
            Visibility(
              visible: controller.noteEntity != null,
              child: const Icon(
                Icons.delete_outlined,
                size: 35,
                color: Colors.black,
              ).gestures(onTap: () {
                controller.deleteNote(controller.noteEntity!.id);
              }),
            ),
            const Icon(
              Icons.copy,
              size: 30,
              color: Colors.black,
            ).gestures(onTap: () {
              controller.copyNote();
            })
          ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween)
        ].toColumn(),
      )
              .decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(20))
              .marginAll(15)),
    );
  }
}
