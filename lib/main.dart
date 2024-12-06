import 'package:book_cover/db_book/db_book.dart';
import 'package:book_cover/pages/book_first/book_content_add/book_content_add_binding.dart';
import 'package:book_cover/pages/book_first/book_content_add/book_content_add_view.dart';
import 'package:book_cover/pages/book_first/book_content_list/book_content_list_binding.dart';
import 'package:book_cover/pages/book_first/book_content_list/book_content_list_view.dart';
import 'package:book_cover/pages/book_first/book_first_binding.dart';
import 'package:book_cover/pages/book_first/book_first_view.dart';
import 'package:book_cover/pages/book_four/book_four_binding.dart';
import 'package:book_cover/pages/book_four/book_four_view.dart';
import 'package:book_cover/pages/book_second/book_second_binding.dart';
import 'package:book_cover/pages/book_second/book_second_view.dart';
import 'package:book_cover/pages/book_second/note_add/note_add_binding.dart';
import 'package:book_cover/pages/book_second/note_add/note_add_view.dart';
import 'package:book_cover/pages/book_second/note_add/toast.dart';
import 'package:book_cover/pages/book_tab/book_tab_binding.dart';
import 'package:book_cover/pages/book_tab/book_tab_view.dart';
import 'package:book_cover/pages/book_third/book_third_binding.dart';
import 'package:book_cover/pages/book_third/book_third_view.dart';
import 'package:book_cover/pages/book_third/feedback/feedback_binding.dart';
import 'package:book_cover/pages/book_third/feedback/feedback_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Color primaryColor = const Color(0xff4e8cff);
Color bgColor = const Color(0xfff8f8f8);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBBook().init());
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Books,
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}

List<GetPage<dynamic>> Books = [
  GetPage(name: '/', page: () => const BookFourView(), binding: BookFourBinding()),
  GetPage(name: '/book_tab', page: () => BookTabPage(), binding: BookTabBinding()),
  GetPage(name: '/book_toast', page: () => const ToastLocal()),
  GetPage(name: '/book_first', page: () => BookFirstPage(), binding: BookFirstBinding()),
  GetPage(name: '/book_second', page: () => BookSecondPage(), binding: BookSecondBinding()),
  GetPage(name: '/book_third', page: () => BookThirdPage(), binding: BookThirdBinding()),
  GetPage(name: '/book_content_list', page: () => BookContentListPage(), binding: BookContentListBinding()),
  GetPage(name: '/book_content_add', page: () => BookContentAddPage(), binding: BookContentAddBinding()),
  GetPage(name: '/note_add', page: () => NoteAddPage(), binding: NoteAddBinding()),
  GetPage(name: '/feedback', page: () => FeedbackPage(), binding: FeedbackBinding())
];
