import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sidmap/data/arc_data.dart';

import '../helpers/arc_helpers.dart';

const Haversine _haversine = Haversine();

List<LatLng> arcFromPointToCourse(
    {required LatLng startPoint,
    required double startCourse,
    required double radius,
    required bool isClockWise,
    required double endCourse}) {
  List<LatLng> arcPoints = [];

  if (isClockWise) {
    // находим центр
    double toCenterCourse = turnToRight90(startCourse);
    double bearingToCenter = bearingFromCourse(toCenterCourse);

    final LatLng center = _haversine.offset(
        startPoint, radius, bearingToCenter);

    // arcPoints.add(startPoint);
    // arcPoints.add(center);


    List<LatLng> points = getTurnArc(startPoint, startCourse, radius, endCourse, isClockWise).arc.points;

    arcPoints.addAll(points);


  } else {
    // находим центр
    double toCenterCourse = turnToLeft90(startCourse);
    double bearingToCenter = bearingFromCourse(toCenterCourse);
    debugPrint('toCenterCourse $toCenterCourse');
    debugPrint('bearingToCenter $bearingToCenter');
    final LatLng center = _haversine.offset(
        startPoint, radius, bearingToCenter);

    arcPoints.add(startPoint);
    arcPoints.add(center);
  }






  return arcPoints;
}

// Возвращает дугу, постороенную по:
// входная точка (LatLng),
// входной курс (истинный, 0..360),
// радиус разворота (meters),
// выходной курс  (истинный, 0..360),
// направление (по часовой - true).
ArcData getTurnArc(LatLng startPoint, double currentCourse, double turnRadius,
    double exitCourse, bool isClockWise) {
  double courseL = turnToLeft90(currentCourse);
  double courseR = turnToRight90(currentCourse);

  late double courseToCenter;
  late double arcStartAngle;
  late double arcEndAngle;

  if (isClockWise) {
    courseToCenter = courseR;
    arcStartAngle = courseL;
    //
    arcEndAngle = turnToLeft90(exitCourse);
  } else {
    courseToCenter = courseL;
    arcStartAngle = courseR;
    //
    arcEndAngle = turnToRight90(exitCourse);
  }

  LatLng arcCenter = const Haversine()
      .offset(startPoint, turnRadius, bearingFromCourse(courseToCenter));

  return getSimpleArc(
      arcCenter, turnRadius, arcStartAngle, arcEndAngle, isClockWise);
}

// возвращает ArcData в виде дуги c:
// центром в center
// радиусом radius
// началом на startAngle концом на endAngle ( 0...360 )
// clockWise - по часовой стрелке
// и выходной точки дуги
ArcData getSimpleArc(LatLng center, double radius, double startAngle,
    double endAngle, bool isClockwise) {
  List<LatLng> arcPoints = []; // точки дуги

  if (!isClockwise) {
    double temp = startAngle;
    startAngle = endAngle;
    endAngle = temp;
  }

  LatLng startPoint =
      _haversine.offset(center, radius, bearingFromCourse(startAngle));
  LatLng endPoint =
      _haversine.offset(center, radius, bearingFromCourse(endAngle));

  arcPoints.add(startPoint);

  if (startAngle < endAngle) {
    arcPoints.addAll(getCwArcPoints(center, radius, startAngle, endAngle));
  } else {
    arcPoints.addAll(getCwArcPoints(center, radius, startAngle, 360.0));
    arcPoints.addAll(getCwArcPoints(center, radius, 0.0, endAngle));
  }

  arcPoints.add(endPoint);

  Polyline arc = Polyline(
    points: arcPoints,
    color: Colors.green,
    strokeWidth: 5,
  );

  LatLng last = isClockwise ? endPoint : startPoint;
  return ArcData(arc, last);
}

List<LatLng> getCwArcPoints(
    LatLng center, double radius, double startAngle, double endAngle) {
  List<LatLng> arcPoints = [];
  LatLng startPoint =
      _haversine.offset(center, radius, bearingFromCourse(startAngle));
  LatLng endPoint =
      _haversine.offset(center, radius, bearingFromCourse(endAngle));
  arcPoints.add(startPoint);

  double sectorAngle = 8;

  double arcPointAngle = startAngle;
  while (arcPointAngle < endAngle - sectorAngle) {
    arcPointAngle += sectorAngle;

    LatLng point =
        _haversine.offset(center, radius, bearingFromCourse(arcPointAngle));

    arcPoints.add(point);
  }

  arcPoints.add(endPoint);
  return arcPoints;
}
