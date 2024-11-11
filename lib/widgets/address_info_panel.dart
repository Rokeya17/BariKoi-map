import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/map_controller.dart';

class AddressInfoPanel extends StatelessWidget {
  final String address;
  final MapController mapController = Get.find<MapController>();

  AddressInfoPanel({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(address),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              if (mapController.locationData.value != null) {
                double startLat = mapController.locationData.value!.latitude!;
                double startLng = mapController.locationData.value!.longitude!;

               
                double destinationLat =
                    23.8103; 
                double destinationLng =
                    90.4125; 

                mapController.getDirections(
                    startLat, startLng, destinationLat, destinationLng);
              } else {
                print("Current location data not available");
              }
            },
            child: const Text("Get Directions"),
          ),
        ],
      ),
    );
  }
}
