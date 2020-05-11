import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class Bloc {
  ValueStream<List<String>> get posts => _postsSubject.stream;

  final _postsSubject = BehaviorSubject<List<String>>();

  CollectionReference get postsCollection =>
      Firestore.instance.collection("posts");

  Bloc() {
    fetchPosts();
  }

  Future fetchPosts() async {
    postsCollection.snapshots().listen((event) {
      final docs = event.documents;
      final data = <String>[];
      docs.forEach((element) => data.add(element["content"]));
      _postsSubject.add(data);
    });
  }

  Future newPost(String content) async {
    postsCollection.add({
      "content": content,
      "timestamp": DateTime.now().millisecondsSinceEpoch,
      "published": false,
    });
  }
}
