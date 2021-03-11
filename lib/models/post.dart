import 'package:intl/intl.dart';

class Post {
  final String title;
  final int wastedItemCount;
  final DateTime date;
  final String imageURL;
  final double latitude;
  final double longitude;

  Post({this.title, this.wastedItemCount, this.date, this.imageURL, this.latitude, this.longitude});

  String get postTitle {
    return title;
  }

  int get postWastedItemCount {
    return wastedItemCount;
  }

  String get postImageURL {
    return imageURL;
  }

  String get postDate {
    return DateFormat('EEE, MMM d, yyyy').format(date).toString();
  }

  double get postLatitude {
    return latitude;
  }

  double get postLongitude {
    return longitude;
  }
}