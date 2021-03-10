
import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/posts_list.dart';

class PostsScreen extends StatelessWidget {
  PostsScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Column(
        children: [
          PostsList(title: title,),
          Container(
            padding: const EdgeInsets.all(50.0),
            child: FloatingActionButton(
              backgroundColor: Colors.orange,
              child: Icon(Icons.camera_alt),
              onPressed: null
            ),
          )
        ]
      )
    );
  }
}