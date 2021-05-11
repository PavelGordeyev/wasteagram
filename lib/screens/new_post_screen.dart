
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wasteagram/widgets/new_post.dart';

class NewPostScreen extends StatefulWidget {
  NewPostScreen({Key key, this.title}) : super(key: key);

  @override
  _NewPostScreenState createState() => _NewPostScreenState();

  final String title;
}

class _NewPostScreenState extends State<NewPostScreen> {

  File image;
  final picker = ImagePicker();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: NewPost(),
      resizeToAvoidBottomInset: false
      );
  }
}