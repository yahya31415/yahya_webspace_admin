import 'package:flutter/material.dart';
import 'package:yahya_webspace_admin/pages/newPostPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;

  void setCurrentTab(int index) {
    setState(() {
      currentTab = index;
    });
  }

  Widget get body {
    switch (currentTab) {
      case 0:
        return Container();
      case 1:
        return NewPostPage();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yahya\'s Webspace'),
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.short_text),
            title: Text('Posts'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            title: Text('New'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          )
        ],
        onTap: setCurrentTab,
        currentIndex: currentTab,
      ),
    );
  }
}
