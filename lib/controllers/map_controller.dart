import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

class MapController extends GetxController {
  var locationData = Rxn<LocationData>();
  var addressInfo = ''.obs;
  var directions = ''.obs;

  Location location = Location();
  final String apiKey = 'API_KEY';

  @override
  void onInit() {
    super.onInit();
    requestLocationPermission();
  }

  Future<void> requestLocationPermission() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
    }

    if (permissionGranted == PermissionStatus.granted) {
      locationData.value = await location.getLocation();
    }
  }

  Future<void> getAddressFromCoordinates(
      double latitude, double longitude) async {
    final url = Uri.parse(
        'https://barikoi.xyz/v1/api/search/reverse/$apiKey/$latitude/$longitude');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      addressInfo.value = data['place']['address'];
    } else {
      addressInfo.value = "Error fetching address";
    }
  }

  Future<void> getDirections(
      double startLat, double startLng, double endLat, double endLng) async {
    final url = Uri.parse(
        'https://barikoi.xyz/v1/api/search/directions/$apiKey/$startLat/$startLng/$endLat/$endLng');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      directions.value = data['geojson'];
    } else {
      directions.value = "Error fetching directions";
    }
  }
}
