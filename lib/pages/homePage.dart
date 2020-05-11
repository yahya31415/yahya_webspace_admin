import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yahya_webspace_admin/pages/newPostPage.dart';
import 'package:yahya_webspace_admin/pages/postsPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void setCurrentTab(int index) {
    setState(() {
      currentTab = index;
    });
  }

  Widget get body {
    switch (currentTab) {
      case 0:
        return PostsPage();
      case 1:
        return NewPostPage();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return _loginPage();
          }
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
        });
  }

  Widget _loginPage() {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Center(
                child: Image.asset(
                  "assets/yahya-webspace-login.png",
                  height: 260,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Log in to admin',
                  style: Typography.whiteCupertino.headline1
                      .copyWith(fontSize: 26),
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email ID',
              ),
            ),
            TextField(
              keyboardType: TextInputType.visiblePassword,
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                child: Text('Log In'),
                onPressed: () => _logIn(context),
              ),
            ),
            Spacer(flex: 1)
          ],
        ),
      ),
    );
  }

  _logIn(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;

    showDialog(
        context: context,
        child: AlertDialog(
          title: Text('Logging In'),
          content: LinearProgressIndicator(),
        ));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pop(context);
    } catch (error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          child: AlertDialog(
            title: Text('Error'),
            content: Text(error.toString()),
          ));
    }
  }
}
