import 'package:flutter/material.dart';
import 'package:inventory_test/pages/add-item_page.dart';
import 'package:inventory_test/pages/home_page.dart';
import 'package:inventory_test/shared/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: whiteColor,
        appBarTheme: AppBarTheme(
          backgroundColor: whiteColor,
          elevation: 2,
          centerTitle: true,
          iconTheme: IconThemeData(color: blackColor),
          titleTextStyle: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/add-item': (context) => const AddItemPage(),
      },
    );
  }
}
