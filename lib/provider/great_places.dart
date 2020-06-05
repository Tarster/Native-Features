import 'package:flutter/foundation.dart';

import '../model/place.dart';

class GreatPlaces with ChangeNotifier {

List<Place> _item=[];

List<Place> get items{
  return [..._item];
}

}