
import 'package:flutter/material.dart';
import 'package:wasteagram/screens/posts_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wasteagram',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PostsScreen(title: 'Wasteagram'),
    );
  }
}