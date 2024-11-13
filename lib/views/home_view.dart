import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maplibre_gl/maplibre_gl.dart';

import '../controllers/map_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeMapController mapController = Get.put(HomeMapController());

    return Scaffold(
      body: Stack(
        children: [
          Obx(() {
            if (mapController.locationData.value != null) {
              return MapLibreMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    mapController.locationData.value!.latitude!,
                    mapController.locationData.value!.longitude!,
                  ),
                  zoom: 8,
                ),
                onMapCreated: (map) {
                  mapController.maplibreMapController = map;
                },
                annotationOrder: const [AnnotationType.circle],
                myLocationEnabled: true,
                compassEnabled: true,
                myLocationTrackingMode: MyLocationTrackingMode.tracking,
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  topLeft: Radius.circular(8),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(() {
                    return Text(
                      mapController.addressInfo.value,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await mapController.requestLocationPermission();
                      mapController.updateMapLocation();
                    },
                    child: const Text('Show Current Address'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
