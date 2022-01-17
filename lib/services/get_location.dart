import 'package:geolocator/geolocator.dart';

Future<Position> requestPermissionLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    return Future.error('Serviço de localização desativado.');
  }

  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Serviço de localização desativado.');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error('Serviço de localização desativado permanentemente.');
  }

  return await Geolocator.getCurrentPosition();
}
