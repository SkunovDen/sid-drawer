import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

const Haversine _haversine = Haversine();

Polyline getArc(LatLng startPoint, double bearingStart, bearingEnd) {
  for (var i = 0; i < 360; i++) {
    double norm = courseToBearing(i as double);
    debugPrint('Course : $i   Bearing: $norm');
    turnCenter(i as double, true, 2000);
  }

  double nBearingStart = normalizeBearing(bearingStart - 90.0);
  debugPrint('Normalized bearing: $nBearingStart');
  if (nBearingStart > 180) nBearingStart -= 360.0;

  double nBearingEnd = normalizeBearing(bearingEnd - 90.0);
  debugPrint('Normalized bearing: $nBearingEnd');
  nBearingStart += 180;
  if (nBearingEnd > 180) nBearingEnd -= 360.0;

  LatLng firstPoint = _haversine.offset(startPoint, 8000.0, bearingStart);
  debugPrint('FP $firstPoint');

  double arcRadius = 3000;

  LatLng arcCenter = _haversine.offset(firstPoint, arcRadius, nBearingStart);

  LatLng ep = _haversine.offset(arcCenter, arcRadius, nBearingEnd);

  debugPrint('BEARINGS $nBearingStart $bearingEnd');

  return Polyline(
    points: [firstPoint, arcCenter, ep],
    color: Colors.black,
    strokeWidth: 2,
  );
}

double courseToBearing(double course) {
  double nBearing = normalizeBearing(course);
  if (nBearing > 180) return nBearing - 360.0;
  return nBearing;
}

double turnCenter(double currentCourse, bool clockWiseTurn, double radius) {
  double leftTraverse = courseToBearing(currentCourse - 90);
  double rightTraverse = courseToBearing(currentCourse + 90);

  debugPrint(
      'Current course : $currentCourse  Left: $leftTraverse  Right: $rightTraverse');

  return 1;
}
