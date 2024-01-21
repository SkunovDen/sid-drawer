import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

double bearingFromCourse(double course) {
  return course > 180 ? course - 360 : course;
}

double turnToLeft90(double currentCourse) {
  double t = currentCourse - 90.0;
  return t < 0 ? 360 + t : t;
}

double turnToRight90(double currentCourse) {
  double t = currentCourse + 90.0;
  return t > 360 ? t - 360 : t;
}

double courseBetween(LatLng pointFrom, LatLng pointTo) {
  double bearing = Geolocator.bearingBetween(pointFrom.latitude,
      pointFrom.longitude, pointTo.latitude, pointTo.longitude);

  return bearing < 0 ? bearing + 360.0 : bearing;
}
