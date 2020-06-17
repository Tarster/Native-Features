//Default imports
import 'package:flutter/material.dart';
import 'package:nativefeatures/provider/great_places.dart';
import 'package:provider/provider.dart';

//Provider Imports
import '../provider/great_places.dart';

//Screen imports
import '../screens/add_place_screen.dart';

class PlaceListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Great Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          )
        ],
      ),
      //body: Text('Hello'),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(child: CircularProgressIndicator())
            : Consumer<GreatPlaces>(
                builder: (context, greatplaces, child) =>
                    greatplaces.items.length <= 0
                        ? child
                        : ListView.builder(
                            itemCount: greatplaces.items.length,
                            itemBuilder: (context, i) => ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        FileImage(greatplaces.items[i].image),
                                  ),
                                  title: Text(greatplaces.items[i].title),
                                  subtitle: Text(
                                      greatplaces.items[i].location.address),
                                  onTap: () {},
                                )),
                child: Center(child: Text('Got no places to show,Start adding new places'),),
              ),
      ),
    );
  }
}
