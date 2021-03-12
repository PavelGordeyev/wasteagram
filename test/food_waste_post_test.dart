import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:wasteagram/models/post.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  test('Post created from map has appropriate post property values', () {
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

  test('Long date is correctly formatted', () {

    final datePosted = Timestamp.fromDate(DateTime(2021,1,1));
    final strDateLong = 'Friday, January 1, 2021';

    final post = Post();
    post.datePosted = datePosted;

    expect(post.postDateLong, strDateLong);
  });

  test('Short date is correctly formatted', () {

    final datePosted = Timestamp.fromDate(DateTime(2021,1,1));
    final strDateShort = 'Fri, Jan 1, 2021';

    final post = Post();
    post.datePosted = datePosted;

    expect(post.postDateShort, strDateShort);
  });
}