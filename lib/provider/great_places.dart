import 'package:flutter/foundation.dart';
import 'dart:io';

import '../model/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _item = [];

  List<Place> get items {
    return [..._item];
  }

  void addplaces(String title, File image) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: title,
        image: image,
        location: null);

        _item.add(newPlace);
        notifyListeners();
  }
}
