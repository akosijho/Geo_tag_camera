import 'dart:io';
import 'dart:core';

import 'package:geolocator/geolocator.dart';

class GeoImageObject {
  GeoImageObject({
    required this.imageFile,
    required this.position,
    required this.compasDirection,
    required this.address,
  });

  final File imageFile;
  final Position? position;
  final String compasDirection;
  final String address;
}
