import 'package:flutter/foundation.dart';
import 'dart:io';

import '../model/place.dart';

import '../helper/db_helper.dart';
import '../helper/location_helper.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _item = [];

  List<Place> get items {
    return [..._item];
  }

  Place findbyId(String id){
    return _item.firstWhere((place) => place.id==id);
  }

  Future<void> addplaces(
      String title, File image, PlaceLocation pickedLocation) async {
    final address = await LocationHelper.getPlaceAddress(
        lat: pickedLocation.latitude, lng: pickedLocation.longtitiude);
    final updateLocation = PlaceLocation(
        latitude: pickedLocation.latitude,
        longtitiude: pickedLocation.longtitiude,
        address: address);
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: title,
        image: image,
        location: updateLocation);

    _item.add(newPlace);
    notifyListeners();
    DBHelper.insert(
      'places',
      {
        'id': newPlace.id,
        'title': newPlace.title,
        'image': newPlace.image.path,
        'loc_lat': newPlace.location.latitude,
        'loc_lng': newPlace.location.longtitiude,
        'address': newPlace.location.address,
      },
    );
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('places');
    _item = dataList
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            location: PlaceLocation(
              latitude: item['loc_lat'],
              longtitiude: item['loc_lng'],
              address: item['address'],
            ),
          ),
        ).toList();
    notifyListeners();
  }
}
