import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get dark => ThemeData(
        primarySwatch: Colors.red,
        buttonColor: Colors.red,
        hintColor: Colors.grey.shade500,
        backgroundColor: Colors.grey.shade900,
        scaffoldBackgroundColor: Colors.grey.shade900,
        canvasColor: Colors.grey.shade900,
        dialogBackgroundColor: Colors.grey.shade800,
        cardColor: Colors.grey.shade800,
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
        ),
        textTheme: Typography.whiteCupertino,
      );
  static ThemeData get light => ThemeData();
}
