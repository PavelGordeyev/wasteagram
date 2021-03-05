
import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/posts_list.dart';

class PostsScreen extends StatelessWidget {
  PostsScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: PostsList(),
    );
  }
}