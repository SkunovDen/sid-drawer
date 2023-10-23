import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

double bearingFromCourse(double course) {
  return course > 180 ? course - 360 : course;
}

double courseBetween(LatLng pointFrom, LatLng pointTo) {
  double bearingBetween = Geolocator.bearingBetween(
      pointFrom.latitude, pointFrom.longitude,
      pointTo.latitude, pointTo.longitude);

  double courseBetweenResult = bearingBetween < 0 ? 360.0 + bearingBetween : bearingBetween;

  debugPrint('CourseBetween $courseBetweenResult');
  return courseBetweenResult;
}


double turnToLeft90(double currentCourse) {
  double t = currentCourse - 90.0;
  return t < 0 ? 360 + t : t;
}

double turnToRight90(double currentCourse) {
  double t = currentCourse + 90.0;
  return t > 360 ? t - 360 : t;
}
