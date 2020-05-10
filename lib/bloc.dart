import 'package:rxdart/rxdart.dart';

class Bloc {
  ValueStream<List<String>> get posts => _postsSubject.stream;

  final _postsSubject = BehaviorSubject<List<String>>();

  Bloc() {
    fetchPosts();
  }

  Future fetchPosts() async {
    _postsSubject.add([
      '''
## Introduction

I am making a blog for myself

### Why?

Because why not

### Still there must be some reason

Not really, no reason

## Features

1. It supports **bold text**
2. Also *italic texts*
3. And it can do [links](http://caprimul.com)
4. Even images

![some image](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "caprimul")

**And last but not least**

```dart
final result  = ‘I can write code here’;
```
    '''
    ]);
  }

  Future newPost(String content) async {
    final _posts = posts.value;
    _posts.add(content);
    _postsSubject.add(_posts);
  }
}
