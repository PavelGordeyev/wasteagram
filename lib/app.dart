
import 'package:flutter/material.dart';
import 'package:wasteagram/screens/posts_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PostsScreen(title: 'Flutter Demo Home Page'),
    );
  }
}