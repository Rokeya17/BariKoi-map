import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/map_controller.dart';
import '../widgets/address_info_panel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final MapController mapController = Get.put(MapController());
    return Scaffold(
      body: Stack(
        children: [
          Obx(() {
            if (mapController.locationData.value != null) {
              // Here you would place your map widget
              return const Text("Map loaded with current location");
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Obx(() => AddressInfoPanel(
                  address: mapController.addressInfo.value,
                )),
          ),
        ],
      ),
    );
  }
}
