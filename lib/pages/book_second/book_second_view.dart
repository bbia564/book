import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'book_second_logic.dart';

class BookSecondPage extends GetView<BookSecondLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [
          const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ).marginOnly(right: 20).gestures(onTap: () {
            Get.toNamed('/note_add')?.then((_) {
              controller.getData();
            });
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
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 165 / 143),
                itemCount: controller.list.value.length,
                itemBuilder: (_, index) {
                  final entity = controller.list.value[index];
                  return Container(
                    padding: const EdgeInsets.all(12),
                    child: <Widget>[
                      Container(
                        child: Text(
                          entity.content,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      <Widget>[
                        Expanded(child: Text(entity.title)),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(entity.createdTimeString)
                      ].toRow()
                    ].toColumn(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start),
                  ).decorated(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)).gestures(onTap: (){
                        Get.toNamed('/note_add', arguments: entity)?.then((_) {
                          controller.getData();
                        });
                  });
                });
      }),
    );
  }
}
