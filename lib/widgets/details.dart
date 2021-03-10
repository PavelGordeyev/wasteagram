import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wasteagram/widgets/posts_list.dart';

class Details extends StatelessWidget {
  Details({Key key, this.document}) : super(key: key);

  final DocumentSnapshot document;

  @override
  Widget build(BuildContext context) {
    return 
    
    Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                heightFactor: 5.0,
                child: Text(
                    DateFormat('EEE, MMM d, yyyy').format(DateTime.fromMillisecondsSinceEpoch(document['date_posted'].seconds * 1000)).toString(),
                    style: Theme.of(context).textTheme.headline5,
            ),
              ),
              ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                heightFactor: 5.0,
                child: Text("${document['count']} items"),
              ),
            ],
          ),
        ]
      );
  }
}