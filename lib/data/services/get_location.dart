import 'package:geolocator/geolocator.dart';

abstract class GeolocationService {
  Future<LocationPermission> requestPermissionLocation();
  Future<LocationPermission> getStatusPermission();
  Future<Position> getCurrentPosition();
}

class GeolocationServiceImpl implements GeolocationService {
  @override
  Future<Position> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition();
  }

  @override
  Future<LocationPermission> requestPermissionLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return LocationPermission.unableToDetermine;
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return permission;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return permission;
    }

    return permission;
  }

  @override
  Future<LocationPermission> getStatusPermission() async {
    return await Geolocator.checkPermission();
  }
}