import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class FlutterMapPickerScreen extends StatefulWidget {
  const FlutterMapPickerScreen({super.key});

  @override
  State<FlutterMapPickerScreen> createState() => _FlutterMapPickerScreenState();
}

class _FlutterMapPickerScreenState extends State<FlutterMapPickerScreen> {
  LatLng? selected;
  final MapController _mapController = MapController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Location"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, selected);
            },
            child: const Text("Confirm"),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _goToCurrentLocation,
        child: const Icon(Icons.my_location),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: LatLng(30.0444, 31.2357),
          initialZoom: 13,
          onTap: (tapPosition, point) {
            setState(() {
              selected = point;
            });
          },
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
            userAgentPackageName: 'Luxury Golf Egypt',
          ),
          MarkerLayer(
            markers:
                selected != null
                    ? [
                      Marker(
                        point: selected!,
                        width: 80,
                        height: 80,
                        child: const Icon(
                          Icons.location_pin,
                          size: 50,
                          color: Colors.red,
                        ),
                      ),
                    ]
                    : [],
          ),
        ],
      ),
    );
  }

  Future<void> _goToCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    if (permission == LocationPermission.deniedForever) return;

    Position position = await Geolocator.getCurrentPosition();

    LatLng current = LatLng(position.latitude, position.longitude);

    setState(() {
      selected = current;
    });

    _mapController.move(current, 15);
  }
}
