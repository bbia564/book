
import 'package:book_cover/pages/book_third/feedback/book_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'feedback_logic.dart';

class FeedbackPage extends GetView<FeedbackLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Feedback",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [
         const Text(
            'Commit',
            style: TextStyle(color: Colors.white),
          ).marginOnly(right: 20).gestures(onTap: () {
            controller.commit();
          })
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<FeedbackLogic>(builder: (_) {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    child: <Widget>[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        child: BookTextField(
                            maxLength: 500,
                            maxLines: 6,
                            value: controller.content,
                            hintText: 'Feedback content',
                            onChange: (value) {
                              controller.content = value;
                            }),
                      ).decorated(
                          border: Border.all(color: Colors.grey[200]!),
                          borderRadius: BorderRadius.circular(12)),
                      const SizedBox(height: 15),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: 150,
                          height: 150,
                          child: controller.image == null
                              ? const Icon(
                            Icons.photo,
                            size: 60,
                            color: Colors.grey,
                          )
                              : Image.memory(
                            controller.image!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ).decorated(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12)).gestures(
                            onTap: () {
                              controller.imageSelected();
                            }),
                      )
                    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                  ).decorated(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12))
                ].toColumn(),
              );
            }).marginAll(15)),
      ),
    );
  }
}
