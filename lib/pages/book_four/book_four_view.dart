import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'book_four_logic.dart';

class LocalToolView extends GetView<PageLogic> {
  const LocalToolView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.graham.value
              ? const CircularProgressIndicator(color: Colors.lightGreenAccent)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.qiaz();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
