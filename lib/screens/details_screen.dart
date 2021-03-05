import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/details.dart';
import 'package:wasteagram/widgets/posts_list.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Details()
        ]
      )
    );
  }
}