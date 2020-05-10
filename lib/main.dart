import 'package:flutter/material.dart';

import 'pages/homePage.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yahya\'s Webspace',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: HomePage(),
    );
  }
}
