import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/posts_list.dart';

class Details extends StatelessWidget {
  Details({Key key}) : super(key: key);

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
                child: Text("Hello"),
              ),
              ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                heightFactor: 5.0,
                child: Text("Hello"),
              ),
            ],
          ),
        ]
      );
  }
}