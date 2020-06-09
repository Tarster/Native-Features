//Default imports
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

//Provider Imports
// import './provider/great_places.dart';

//Screen imports
import '../screens/add_place_screen.dart';
import 'add_place_screen.dart';

class PlaceListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Great Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          )
        ],
      ),
      body: Center(child: CircularProgressIndicator(),),
    );
  }
}
