import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:wasteagram/models/post.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  test('Post created from map correctly', () {
    final datePosted = Timestamp.now();
    const url = 'https://www.google.com';
    const lat = 2.0;
    const long = 1.0;
    const count = 9;

    final post = Post.fromMap({
      'datePosted' : datePosted,
      'wastedItemCount' : count,
      'latitude' : lat,
      'longitude' : long,
      'imageURL' : url
    });

    expect(post.datePosted, datePosted);
    expect(post.wastedItemCount, count);
    expect(post.latitude, lat);
    expect(post.longitude, long);
    expect(post.imageURL, url);

  });
}