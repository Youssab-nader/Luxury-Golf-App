import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

abstract class MapPickerService {
  Future<LatLng?> pickLocation(BuildContext context);
}