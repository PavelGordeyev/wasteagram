import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Post {
  int wastedItemCount;
  Timestamp datePosted;
  String imageURL;
  double latitude;
  double longitude;

  Post({this.wastedItemCount, this.datePosted, this.imageURL, this.latitude, this.longitude});

  Post.fromMap(Map post){
    this.datePosted = post['datePosted'];
    this.imageURL = post['imageURL'];
    this.latitude = post['latitude'];
    this.longitude = post['longitude'];
    this.wastedItemCount = post['wastedItemCount'];
  }

  int get postWastedItemCount {
    return wastedItemCount;
  }

  String get postImageURL {
    return imageURL;
  }

  String get postDateShort {
    return DateFormat('EEE, MMM d, yyyy').format(DateTime.fromMillisecondsSinceEpoch(datePosted.seconds * 1000)).toString();
  }

  String get postDateLong {
    return DateFormat('EEEE, MMMM d, yyyy').format(DateTime.fromMillisecondsSinceEpoch(datePosted.seconds * 1000)).toString();
  }

  Timestamp get postDateTimestamp {
    return datePosted;
  }

  double get postLatitude {
    return latitude;
  }

  double get postLongitude {
    return longitude;
  }
}