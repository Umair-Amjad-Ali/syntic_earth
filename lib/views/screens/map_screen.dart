import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  MapScreen({super.key});

  final LatLng mylatlng = LatLng(26.850000, 80.949997);
  final String address = "lucknow";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: mylatlng, zoom: 12),
      ),
    );
  }
}
