//Default imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Provider Imports
import './provider/great_places.dart';

//Screen imports

import './screens/places_list_screen.dart';
import './screens/add_place_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_)=>GreatPlaces(),
          child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primaryColor: Colors.indigo,
          primarySwatch: Colors.amber,
        ),
        home: PlaceListScreen(),
        routes: {
          AddPlaceScreen.routeName:(context)=>AddPlaceScreen(),
        },
      ),
    );
  }
}

