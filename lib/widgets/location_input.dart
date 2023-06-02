import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;
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
            onPressed: () {},
            label: Text(
              'Localização Atual',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          TextButton.icon(
            icon: const Icon(Icons.map),
            onPressed: () {},
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
