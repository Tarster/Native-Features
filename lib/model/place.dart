import 'package:flutter/foundation.dart';

//Native Dart import
import 'dart:io';

class PlaceLocation
{
  final double latitude;
  final double longtitiude;
  final String address;

const PlaceLocation({
  @required this.latitude,
  @required this.longtitiude,
  this.address
});

}


class Place{
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place({
    @required this.id,
    @required this.title,
    @required this.image,
    @required this.location
  });
}