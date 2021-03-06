import 'package:flutter/material.dart';
import 'package:wasteagram/models/post.dart';
import 'package:wasteagram/widgets/details.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key key, this.title, this.post}) : super(key: key);

  final String title;
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Column(
        children: [
          Details(post: post)
        ]
      )
    );
  }
}