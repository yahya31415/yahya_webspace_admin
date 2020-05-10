import 'package:flutter/material.dart';
import 'package:yahya_webspace_admin/main.dart';

class PostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<String>>(
        stream: BlocedWidget.of(context).bloc.posts,
        builder: (context, snapshot) {
          final posts = snapshot.data;
          if (posts == null) {
            return CircularProgressIndicator();
          }
          return ListView.builder(
            itemBuilder: (context, i) => _post(posts[i]),
            itemCount: posts.length,
          );
        });
  }

  Widget _post(String post) {
    return Text(post);
  }
}