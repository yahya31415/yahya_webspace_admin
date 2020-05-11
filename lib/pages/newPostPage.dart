import 'package:flutter/material.dart';

import '../main.dart';

class NewPostPage extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: Column(
        children: <Widget>[
          formatterBar(context),
          _textField(context),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: <Widget>[
                FlatButton(
                  child: Text('POST'),
                  onPressed: () => post(context),
                  textColor: Theme.of(context).buttonColor,
                ),
                FlatButton(
                  child: Text('CLEAR'),
                  onPressed: clear,
                  textColor: Theme.of(context).hintColor,
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    icon: Icon(Icons.keyboard_hide),
                    onPressed: () {
                      dismissKeyboard(context);
                    },
                    color: Theme.of(context).hintColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void dismissKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  Row formatterBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          icon: Text('H1'),
          onPressed: () => format(FormatOption.heading1),
          color: Theme.of(context).hintColor,
        ),
        IconButton(
          icon: Text('H2'),
          onPressed: () => format(FormatOption.heading2),
          color: Theme.of(context).hintColor,
        ),
        IconButton(
          icon: Icon(Icons.format_bold),
          onPressed: () => format(FormatOption.bold),
          color: Theme.of(context).hintColor,
        ),
        IconButton(
          icon: Icon(Icons.format_italic),
          onPressed: () => format(FormatOption.italics),
          color: Theme.of(context).hintColor,
        ),
        IconButton(
          icon: Icon(Icons.link),
          onPressed: () => format(FormatOption.link),
          color: Theme.of(context).hintColor,
        ),
        IconButton(
          icon: Icon(Icons.code),
          onPressed: () => format(FormatOption.code),
          color: Theme.of(context).hintColor,
        ),
        IconButton(
          icon: Icon(Icons.image),
          onPressed: () => format(FormatOption.image),
          color: Theme.of(context).hintColor,
        )
      ],
    );
  }

  Expanded _textField(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: TextField(
          expands: true,
          minLines: null,
          maxLines: null,
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Write here...',
            border: InputBorder.none,
            fillColor: Theme.of(context).backgroundColor,
            filled: false,
          ),
        ),
      ),
    );
  }

  void format(FormatOption option) {
    final currentValue = controller.text;
    final cursorPosition = controller.selection.end;
    final half1 = currentValue.substring(0, cursorPosition);
    final half2 = currentValue.substring(cursorPosition, currentValue.length);
    var insert = '';
    switch (option) {
      case FormatOption.heading1:
        insert = '## ';
        break;
      case FormatOption.heading2:
        insert = '### ';
        break;
      case FormatOption.bold:
        insert = '**b**';
        break;
      case FormatOption.italics:
        insert = '*i*';
        break;
      case FormatOption.link:
        insert = '[text](url)';
        break;
      case FormatOption.code:
        insert = '```code```';
        break;
      case FormatOption.image:
        insert = '![alt](url "title")';
        break;
    }
    controller.text = half1 + insert + half2;
  }

  void post(BuildContext context) async {
    final currentValue = controller.text;
    await BlocedWidget.of(context).bloc.newPost(currentValue);
    controller.clear();
    dismissKeyboard(context);
  }

  void clear() {
    controller.clear();
  }
}

enum FormatOption { heading1, heading2, bold, italics, link, code, image }
