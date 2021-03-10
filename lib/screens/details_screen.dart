import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/details.dart';
import 'package:wasteagram/widgets/posts_list.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key key, this.title, this.document}) : super(key: key);

  final String title;
  final DocumentSnapshot document;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Column(
        children: [
          Details(document: document,)
        ]
      )
    );
  }
}