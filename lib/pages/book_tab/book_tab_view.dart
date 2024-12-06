import 'package:book_cover/pages/book_first/book_first_view.dart';
import 'package:book_cover/pages/book_second/book_second_view.dart';
import 'package:book_cover/pages/book_third/book_third_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'book_tab_logic.dart';

class BookTabPage extends GetView<BookTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          BookFirstPage(),
          BookSecondPage(),
          BookThirdPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navBookBars()),
    );
  }

  Widget _navBookBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/item0Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item0Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/item1Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item1Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Note',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/item2Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item2Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Mine',
        )
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        controller.currentIndex.value = index;
        controller.pageController.jumpToPage(index);
      },
    );
  }
}
