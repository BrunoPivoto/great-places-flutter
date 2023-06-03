import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/screens/map_screen.dart';
import 'package:great_places/utils/location_util.dart';

class LocationInput extends StatefulWidget {
  final Function onSelectPosition;
  const LocationInput(
    this.onSelectPosition, {
    super.key,
  });

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  void _showMap(double lat, double lng) {
    final staticMapImageUrl = LocationUtil.generateLocationPreviewImage(latitude: lat, longitude: lng);
    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  Future<void> _getCurrentUserLocation() async {
    try {
      final locData = await Geolocator.getCurrentPosition();

      _showMap(locData.latitude, locData.longitude);
      widget.onSelectPosition(LatLng(locData.latitude, locData.longitude));
    } catch (error) {
      return;
    }
  }

  Future<void> _selectOnMap() async {
    final LatLng selectedPosition = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => const MapScreen(),
      ),
    );

    // ignore: unnecessary_null_comparison
    if (selectedPosition == null) return;

    _showMap(selectedPosition.latitude, selectedPosition.longitude);
    widget.onSelectPosition(selectedPosition);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 170,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey,
          ),
        ),
        child: _previewImageUrl == null
            ? const Text('Nenhuma localização')
            : Image.network(
                _previewImageUrl!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton.icon(
            icon: const Icon(Icons.location_on),
            onPressed: _getCurrentUserLocation,
            label: Text(
              'Localização Atual',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          TextButton.icon(
            icon: const Icon(Icons.map),
            onPressed: _selectOnMap,
            label: Text(
              'Selecionar do Mapa',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ],
      )
    ]);
  }
}
