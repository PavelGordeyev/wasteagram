import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/posts_list.dart';

class Details extends StatelessWidget {
  Details({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    
    Column(
        children: [
          Center(
            child: Row(
              children: [
                Text("Hello"),
              ],
            ),
          ),
          Center(
            child: Row(
              children: [
                Text("World"),
              ],
            ),
          ),
        ]
      );
  }
}