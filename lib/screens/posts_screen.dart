
import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/posts_list.dart';

class PostsScreen extends StatefulWidget {
  PostsScreen({Key key, this.title}) : super(key: key);

  @override
  _PostsScreenState createState() => _PostsScreenState();

  final String title;
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          PostsList(title: widget.title,),
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