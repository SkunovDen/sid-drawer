import 'package:geodesy/geodesy.dart';
import 'package:sidmap/draws/arc/arc_helpers.dart';

List<LatLng> cutAngle(LatLng pointIn, LatLng corner, LatLng pointOut) {
  final List<LatLng> result = [];

  double cornerToInCourse = courseBetween(corner, pointIn);
  double cornerToInDistance =
      Geodesy().distanceBetweenTwoGeoPoints(corner, pointIn) as double;
  double cornerToOutCourse = courseBetween(corner, pointOut);
  double cornerToOutDistance =
      Geodesy().distanceBetweenTwoGeoPoints(corner, pointOut) as double;

  double cutDistance = min(cornerToInDistance, cornerToOutDistance) / 3.0;
  LatLng cutPointIn = const Haversine().offset(corner, cutDistance, bearingFromCourse(cornerToInCourse));
  LatLng cutPointOut = const Haversine().offset(corner, cutDistance, bearingFromCourse(cornerToOutCourse));

  result.addAll([cutPointIn,cutPointOut]);


  return result;
}
