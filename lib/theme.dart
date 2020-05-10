import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get dark => ThemeData.dark().copyWith(
        textTheme: Typography.whiteCupertino,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
          textTheme: Typography.whiteCupertino
              .copyWith(headline6: TextStyle(fontSize: 20)),
        ),
      );
  static ThemeData get light => ThemeData();
}
