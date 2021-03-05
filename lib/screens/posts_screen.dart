import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostsScreen extends StatefulWidget {
  PostsScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {

  // final picker = ImagePicker();

  // File image;

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(
              DateTime.fromMillisecondsSinceEpoch(document['date_posted'].seconds * 1000).toString(),
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffddddff),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text(
              document['count'].toString(),
              style: Theme.of(context).textTheme.headline6,
            ),
          )
        ],
      ),
      onTap: () {
        // print("Should increase votes here");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return Column(
            children: [
              Expanded(
                  child: ListView.builder(
                  itemExtent: 80.0,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) =>
                    _buildListItem(context, snapshot.data.documents[index]),
                ),
              ),

            ],
          );
        }
      ),
    );
  }

  // Future getImage() async {
  //   final pickedFile = await picker.getImage(source: ImageSource.gallery);
  //   image = File(pickedFile.path);
  //   StorageReference storageReference = FirebaseStorage.instance.ref().child('Example.jpg');

  //   StorageUploadTask uploadTask = storageReference.putFile(image);
  //   await uploadTask.onComplete;
  //   final url = await storageReference.getDownloadURL();
  //   print(url);
  //   // setState(() {});
  // }
}