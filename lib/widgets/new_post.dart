import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:wasteagram/models/post.dart';
import 'package:wasteagram/screens/posts_screen.dart';

class NewPost extends StatefulWidget {

  NewPost({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NewPostState createState() => _NewPostState();
  
}

class _NewPostState extends State<NewPost> {

  File image;
  final picker = ImagePicker();
  final formKey = GlobalKey<FormState>();
  final post = Post();

  @override
  Widget build(BuildContext context){

    if(image==null)
      _getImage();
      
    return _post();
  }

  Widget _post(){
    
    if(image == null){
      return Padding(
        padding: EdgeInsets.all(30.0),
        child: Center(
          child: CircularProgressIndicator()
        )
      );
    }
    
    return Column(
      children: [
        imageToPost(),
        wastedItemsForm(),
        Spacer(),
        postButton()
      ],
    );
  }

  Widget imageToPost() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 300, maxWidth: 350),
          child: Image.file(image)
        ),
      ),
    );
  }

  Widget postButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 150.0,
      child: ElevatedButton(
        onPressed: () async {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            _submitPost();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => PostsScreen(title: 'Wasteagram')), 
                (Route<dynamic> route) => false);
          }
        }, 
        child: Icon(Icons.upload_rounded),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
      )
    );
    
  }

  Widget wastedItemsForm() {
    return Padding(
        padding: EdgeInsets.all(40.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                autofocus: false,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(hintText: '# of Wasted Items'),
                style: TextStyle(
                  fontSize: 30.0,
                ),
                onSaved: (value) {
                  post.wastedItemCount = int.parse(value);
                },
                validator: (value) {
                  if (value.isEmpty){
                    return 'Please enter # of wasted items...';
                  }
                  return null;
                },
              ),
            ],
          )
        )
      );
  }

  void _submitPost() async{

    await _uploadGetImageURL();
    await _getLocation();
    post.date = Timestamp.now();

    FirebaseFirestore.instance.collection('posts').add({
      'date_posted': post.postDateTimestamp,
      'image_url': post.postImageURL,
      'latitude': post.postLatitude,
      'longitude': post.postLongitude,
      'count': post.postWastedItemCount
    });

    // debugPrint("date: ${post.postDateLong}");
    // debugPrint("latitude: ${post.postLatitude}");
    // debugPrint("longitude: ${post.postLongitude}");
    // debugPrint("image: ${post.postImageURL}");
    // debugPrint("count: ${post.postWastedItemCount}");
  }

  Future _getLocation() async{
    var locationService = Location();
    LocationData locationData = await locationService.getLocation();
    post.latitude = locationData.latitude;
    post.longitude = locationData.longitude;
  }

  void _getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    image = File(pickedFile.path);
    setState(() { });
  }

  Future _uploadGetImageURL() async {
    StorageReference storageReference = 
      FirebaseStorage.instance.ref().child(_generateFileName(image.path));
    
    StorageUploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.onComplete;

    final imageURL = await storageReference.getDownloadURL();
    post.imageURL = imageURL;
  }

  String _generateFileName(String filename) {
    final String timeStamp = Timestamp.now().seconds.toString();
    final String shortFilename = filename.substring(filename.indexOf('image_picker'));
    return '$timeStamp-$shortFilename';
  }

}