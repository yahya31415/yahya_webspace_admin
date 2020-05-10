import 'package:flutter/material.dart';
import 'package:yahya_webspace_admin/bloc.dart';

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
      home: BlocedWidget(
        child: HomePage(),
        bloc: Bloc(),
      ),
    );
  }
}

class BlocedWidget extends InheritedWidget {
  final Widget child;
  final Bloc bloc;

  BlocedWidget({this.child, this.bloc});

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static BlocedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }
}
