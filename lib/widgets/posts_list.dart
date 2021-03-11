import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wasteagram/models/post.dart';
import 'package:wasteagram/screens/details_screen.dart';

class PostsList extends StatefulWidget {

  PostsList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PostsListState createState() => _PostsListState();
  
}

class _PostsListState extends State<PostsList> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          return _itemList(snapshot: snapshot);
        }
    );
  }

  Post _buildPost(DocumentSnapshot document) {
    final post = Post();

    post.date = document['date_posted'];
    // post.latitude = document['latitude'];
    // post.longitude = document['longitude'];
    post.imageURL = document['image_url'];
    post.wastedItemCount = document['count'];

    return post;
  }

  Widget _itemList({AsyncSnapshot snapshot}) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return _buildListItem(context, _buildPost(snapshot.data.documents[index]));
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: snapshot.data.documents.length,
      )
    );
  }

  Widget _buildListItem(BuildContext context, Post post) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(
              post.postDateLong,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              post.postWastedItemCount.toString(),
              style: Theme.of(context).textTheme.headline6,
            ),
          )
        ],
      ),
      onTap: () { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailsScreen(title: widget.title, post: post,)));
          },
    );
  }
}