import 'package:rxdart/rxdart.dart';

class Bloc {
  ValueStream<List<String>> get posts => _postsSubject.stream;

  final _postsSubject = BehaviorSubject<List<String>>();

  Bloc() {
    fetchPosts();
  }

  Future fetchPosts() async {
    _postsSubject.add([]);
  }

  Future newPost(String content) async {
    final _posts = posts.value;
    _posts.add(content);
    _postsSubject.add(_posts);
  }
}
