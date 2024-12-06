import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'book_first_logic.dart';

class BookFirstPage extends GetView<BookFirstLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book cover', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [
          const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ).marginOnly(right: 20).gestures(onTap: () {
            controller.addBook();
          })
        ],
      ),
      body: Obx(() {
        return controller.list.value.isEmpty
            ? const Center(
                child: Text('No data'),
              )
            : GridView.builder(
                padding: const EdgeInsets.all(15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 107 / 190),
                itemCount: controller.list.value.length,
                itemBuilder: (_, index) {
                  final entity = controller.list.value[index];
                  return Container(
                    child: <Widget>[
                      Image.asset(
                        'assets/icon.webp',
                        width: double.infinity,
                        height: 147,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        entity.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      )
                    ].toColumn(),
                  )
                      .decorated(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12))
                      .gestures(onTap: () {
                    Get.toNamed('/book_content_list', arguments: entity)
                        ?.then((_) {
                      controller.getData();
                    });
                  });
                });
      }),
    );
  }
}
