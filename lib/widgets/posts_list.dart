import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostsList extends StatefulWidget {

  PostsList({Key key}) : super(key: key);

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

  Widget _itemList({AsyncSnapshot snapshot}) {
    return Expanded(
        child: ListView.builder(
        itemExtent: 80.0,
        itemCount: snapshot.data.documents.length,
        itemBuilder: (context, index) =>
          _buildListItem(context, snapshot.data.documents[index]),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(
              DateFormat('EEEE, MMMM dd, yyyy').format(DateTime.fromMillisecondsSinceEpoch(document['date_posted'].seconds * 1000)).toString(),
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Container(
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
}