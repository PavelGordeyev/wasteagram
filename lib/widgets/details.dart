import 'package:flutter/material.dart';
import 'package:wasteagram/models/post.dart';

class Details extends StatelessWidget {
  Details({Key key, this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                heightFactor: 5.0,
                child: Text(
                    post.postDateShort,
                    style: Theme.of(context).textTheme.headline5,
            ),
              ),
              ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 300, maxWidth: 350),
                  child: Image.network(post.postImageURL)
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                heightFactor: 5.0,
                child: Text("${post.postWastedItemCount} items", style: Theme.of(context).textTheme.headline5,),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                heightFactor: 5.0,
                child: Text("Location(${post.postLatitude}, ${post.postLongitude})", style: Theme.of(context).textTheme.headline6,),
              ),
            ],
          ),
        ]
      );
  }
}