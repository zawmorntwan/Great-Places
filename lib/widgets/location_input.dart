// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    final locationData = await Location().getLocation();
    print(locationData.latitude);
    print(locationData.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              ? Text(
                  'No Location Chosen!',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton.icon(
              onPressed: _getCurrentUserLocation,
              icon: Icon(
                Icons.location_on,
              ),
              label: Text(
                'Current Location',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.map,
              ),
              label: Text(
                'Select on Map',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
