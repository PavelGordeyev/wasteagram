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

  // Widget imagePlaceholder() {
  //   if (document['image_url'] == "")
  //     return CircularProgressIndicator();
  //   else
  //     return Image(image: document['image_url']);
  // }

  // void retrieveLocation() async {

  //   LocationData locationData;
  //   var locationService = Location();
    
  //   try {
  //     var _serviceEnabled = await locationService.serviceEnabled();
  //     if (!_serviceEnabled) {
  //       _serviceEnabled = await locationService.requestService();
  //       if (!_serviceEnabled) {
  //         print('Failed to enable service. Returning.');
  //         return;
  //       }
  //     }

  //     var _permissionGranted = await locationService.hasPermission();
  //     if (_permissionGranted == PermissionStatus.denied) {
  //       _permissionGranted = await locationService.requestPermission();
  //       if (_permissionGranted != PermissionStatus.granted) {
  //         print('Location service permission not granted. Returning.');
  //       }
  //     }

  //     locationData = await locationService.getLocation();
  //   } on PlatformException catch (e) {
  //     print('Error: ${e.toString()}, code: ${e.code}');
  //     locationData = null;
  //   }
  //   locationData = await locationService.getLocation();
  // }
}