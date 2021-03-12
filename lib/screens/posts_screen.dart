import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/posts_list.dart';
import 'package:wasteagram/screens/new_post_screen.dart';

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
          Spacer(),
          Container(
            padding: const EdgeInsets.all(50.0),
            child: Semantics(
                child: _photoButton(context),
                button: true,
                enabled: true,
                onTapHint: 'Select a photo',
                label: 'Photo selection button'
              ),
            ),
        ]
      )
    );
  }

  Widget _photoButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.orange,
      child: Icon(Icons.camera_alt),
      onPressed: () { Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewPostScreen(title: 'New Post')));
      }
    );
  }
}