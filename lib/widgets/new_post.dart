import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

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

  @override
  Widget build(BuildContext context){

    if(image==null)
      _getImage();
      
    return _post();
  }

  Widget _post(){
    
    if(image == null)
      return CircularProgressIndicator();
    
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
      height: 100.0,
      child: ElevatedButton(
        onPressed: null, 
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
                decoration: InputDecoration(labelText: '# of Wasted Items'),
                onSaved: (value) {

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

  void _getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    image = File(pickedFile.path);
    setState(() { });
  }

}