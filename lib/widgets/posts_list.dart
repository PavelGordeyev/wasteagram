import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
        stream: FirebaseFirestore.instance
          .collection('posts').orderBy('date_posted', descending: true).snapshots(),
        builder: (context, snapshot) {

          if(snapshot.hasData && snapshot.data.documents != null && snapshot.data.documents.length > 0)
            return _itemList(snapshot: snapshot);
          
          return Padding(
            padding: EdgeInsets.all(30.0),
            child: Center(
              child: CircularProgressIndicator()
            )
          );
        }
    );
  }

  Post _buildPost(DocumentSnapshot document) {
    return Post.fromMap({
      'datePosted' : document['date_posted'],
      'wastedItemCount' : document['count'],
      'latitude' : document['latitude'],
      'longitude' : document['longitude'],
      'imageURL' : document['image_url']
    });
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
    return Semantics(
      child: _listTile(context, post),
      button: false,
      label: 'List element of a wasteagram post made on ${post.postDateLong}',
      onTapHint: 'View data about a wasteagram post',
    );
  }

  Widget _listTile(BuildContext context, Post post) {
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