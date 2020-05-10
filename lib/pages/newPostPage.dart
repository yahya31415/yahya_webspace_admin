import 'package:flutter/material.dart';

import '../main.dart';

class NewPostPage extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Column(
        children: <Widget>[
          formatterBar(),
          _textField(context),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: <Widget>[
                FlatButton(
                  child: Text('POST'),
                  onPressed: () => post(context),
                ),
                FlatButton(
                  child: Text('CLEAR'),
                  onPressed: clear,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Row formatterBar() {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Text('H1'),
          onPressed: () => format(FormatOption.heading1),
        ),
        IconButton(
          icon: Text('H2'),
          onPressed: () => format(FormatOption.heading2),
        ),
        IconButton(
          icon: Icon(Icons.format_bold),
          onPressed: () => format(FormatOption.bold),
        ),
        IconButton(
          icon: Icon(Icons.format_italic),
          onPressed: () => format(FormatOption.italics),
        ),
        IconButton(
          icon: Icon(Icons.link),
          onPressed: () => format(FormatOption.link),
        ),
        IconButton(
          icon: Icon(Icons.code),
          onPressed: () => format(FormatOption.code),
        ),
        IconButton(
          icon: Icon(Icons.image),
          onPressed: () => format(FormatOption.image),
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

  void post(BuildContext context) {
    final currentValue = controller.text;
    BlocedWidget.of(context).bloc.newPost(currentValue);
  }

  void clear() {
    controller.clear();
  }
}

enum FormatOption { heading1, heading2, bold, italics, link, code, image }
