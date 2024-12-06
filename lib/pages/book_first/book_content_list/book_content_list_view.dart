import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'book_content_list_logic.dart';

class BookContentListPage extends GetView<BookContentListLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null,
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        actions: [
          const Icon(
            Icons.delete,
            color: Colors.white,
            size: 30,
          ).marginOnly(right: 20).gestures(onTap: () {
            controller.deleteBook();
          })
        ],
      ),
      body: GetBuilder<BookContentListLogic>(builder: (_) {
        return SafeArea(
            child: <Widget>[
          Container(
            width: double.infinity,
            height: 190,
            padding: const EdgeInsets.all(15),
            child: <Widget>[
              Image.asset(
                'assets/icon.webp',
                width: 107,
                height: 147,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: <Widget>[
                Text(
                  controller.entity.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                const Text(
                  'Tap edit',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ].toColumn(crossAxisAlignment: CrossAxisAlignment.start)),
              const SizedBox(height: 10),
              const Icon(
                Icons.keyboard_arrow_right,
                size: 25,
                color: Colors.white,
              )
            ].toRow(),
          ).decorated(color: Colors.black).gestures(onTap: () {
            controller.updateBookName();
          }),
          Container(
            width: double.infinity,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: <Widget>[
              const Text(
                'Catalogue',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Icon(
                Icons.add,
                size: 30,
                color: Colors.black,
              ).gestures(onTap: () {
                Get.toNamed('/book_content_add',
                        arguments: controller.entity)
                    ?.then((value) {
                      controller.entity = value;
                      controller.update();
                });
              })
            ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
          ).decorated(color: Colors.grey[300]),
          Expanded(
              child: controller.entity.list.isEmpty
                  ? const Center(
                      child: Text('No data'),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(15),
                      itemCount: controller.entity.list.length,
                      itemBuilder: (_, index) {
                        final entity = controller.entity.list[index];
                        return Container(
                          width: double.infinity,
                          color: Colors.transparent,
                          child: <Widget>[
                            Text(
                              entity.title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              entity.content,
                              style: const TextStyle(fontSize: 14),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              entity.createdTimeString,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.grey),
                            ),
                            Divider(
                              height: 20,
                              color: Colors.grey[300],
                            )
                          ].toColumn(
                              crossAxisAlignment: CrossAxisAlignment.start),
                        ).gestures(onTap: () {
                          Get.toNamed('/book_content_add',
                                  arguments: controller.entity,
                                  parameters: {'index': index.toString()})
                              ?.then((value) {
                            controller.entity = value;
                            controller.update();
                          });
                        });
                      }))
        ].toColumn());
      }),
    );
  }
}
