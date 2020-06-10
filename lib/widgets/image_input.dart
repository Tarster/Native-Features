import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  //final picker = ImagePicker();
  
  File _storedImage;

  Future<void> _getImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);

    setState(() {
      _storedImage = File(pickedFile.path);
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.red,
            ),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text('No image Taken',textAlign: TextAlign.center,),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: FlatButton.icon(
            icon: Icon(Icons.camera),
            label: Text('Take Picture',textAlign: TextAlign.center,),
            textColor: Theme.of(context).primaryColor,
            onPressed: _getImage,
          ),
        ),
      ],
    );
  }
}
