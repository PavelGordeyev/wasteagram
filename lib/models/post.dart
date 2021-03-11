import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Post {
  int wastedItemCount;
  Timestamp date;
  String imageURL;
  double latitude;
  double longitude;

  Post({this.wastedItemCount, this.date, this.imageURL, this.latitude, this.longitude});

  int get postWastedItemCount {
    return wastedItemCount;
  }

  String get postImageURL {
    return imageURL;
  }

  String get postDateShort {
    return DateFormat('EEE, MMM d, yyyy').format(DateTime.fromMillisecondsSinceEpoch(date.seconds * 1000)).toString();
  }

  String get postDateLong {
    return DateFormat('EEEE, MMMM d, yyyy').format(DateTime.fromMillisecondsSinceEpoch(date.seconds * 1000)).toString();
  }

  double get postLatitude {
    return latitude;
  }

  double get postLongitude {
    return longitude;
  }
}