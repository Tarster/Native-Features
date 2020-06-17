import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import '../widgets/image_input.dart';
import '../widgets/location_input.dart';

import '../provider/great_places.dart';

import '../model/place.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add_Place_Screen';
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File _pickedImage;
  PlaceLocation _pickedLocation;

  void _selectedImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _selectPlace(double lat ,double lng)
  {
      _pickedLocation =PlaceLocation(latitude: lat, longtitiude: lng);
  }

  void _savePlaces() {
    if (_titleController.text.isEmpty || _pickedImage == null || _pickedLocation ==null ) return;

    Provider.of<GreatPlaces>(context, listen: false)
        .addplaces(_titleController.text, _pickedImage,_pickedLocation);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Place Screen'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () {}),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ImageInput(_selectedImage),
                    SizedBox(
                      height: 10,
                    ),
                    LocationInput(_selectPlace),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            onPressed: _savePlaces,
            elevation: 0,
            label: Text('Add Places'),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}
