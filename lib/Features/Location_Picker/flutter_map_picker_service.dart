import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:luxury_golf_app/Features/Location_Picker/flutter_map_screen.dart';
import 'package:luxury_golf_app/Features/Location_Picker/map_picker_service.dart';

class FlutterMapPickerService implements MapPickerService {
  @override
  Future<LatLng?> pickLocation(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const FlutterMapPickerScreen(),
      ),
    );

    return result;
  }
}