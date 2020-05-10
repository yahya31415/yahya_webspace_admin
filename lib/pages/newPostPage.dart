import 'package:flutter/material.dart';

class NewPostPage extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Text('H1'),
                onPressed: () => format(),
              ),
              IconButton(
                icon: Text('H2'),
                onPressed: () => format(),
              ),
//              IconButton(
//                icon: Text('H3'),
//                onPressed: () => format(),
//              ),
              IconButton(
                icon: Icon(Icons.format_bold),
                onPressed: () => format(),
              ),
              IconButton(
                icon: Icon(Icons.format_italic),
                onPressed: () => format(),
              ),
              IconButton(
                icon: Icon(Icons.link),
                onPressed: () => format(),
              ),
              IconButton(
                icon: Icon(Icons.code),
                onPressed: () => format(),
              ),
              IconButton(
                icon: Icon(Icons.image),
                onPressed: () => format(),
              )
            ],
          ),
          _textField(context),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: <Widget>[
                FlatButton(
                  child: Text('POST'),
                  onPressed: post,
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

  Expanded _textField(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: TextField(
          expands: true,
          minLines: null,
          maxLines: null,
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

  void format() {}

  void post() {}

  void clear() {}
}
