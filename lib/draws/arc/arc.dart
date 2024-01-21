import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../data/arc_data.dart';
import 'arc_helpers.dart';

const Haversine _haversine = Haversine();

List<LatLng> arcToCourse({
  required String direction,
  required LatLng startPoint,
  required double startCourse,
  required double radius,
  required double outCourse,
}) {
  dev.log(
      '[ ARC ] $direction arcToCourse radius $radius: $outCourse start from $startPoint with start course $startCourse ');
  final List<LatLng> arcPoints = [];
  if (direction == 'R') {
    //clockWise
    final double toArcCenter = turnToRight90(startCourse);
    final LatLng arcCenter = _haversine.offset(startPoint, radius, normalizeBearing(toArcCenter));

    double arcCourse = startCourse;
    while (arcCourse < outCourse) {
      final LatLng arcPoint = _haversine.offset(arcCenter, radius, normalizeBearing(turnToLeft90(arcCourse)));

      arcPoints.add(arcPoint);
      arcCourse += 1;
    }
  } else {
    if (direction == 'L') {
      //counterClockWise
    }
  }

  return arcPoints;
}

// Возвращает дугу, постороенную по:
// входная точка (LatLng),
// входной курс (истинный, 0..360),
// радиус разворота (meters),
// выходной курс  (истинный, 0..360),
// направление (по часовой - true).
ArcData getTurnArc(LatLng startPoint, double currentCourse, double turnRadius, double exitCourse, bool isClockWise) {
  final double courseL = turnToLeft90(currentCourse);
  final double courseR = turnToRight90(currentCourse);

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

  final LatLng arcCenter = const Haversine().offset(startPoint, turnRadius, bearingFromCourse(courseToCenter));

  return getSimpleArc(arcCenter, turnRadius, arcStartAngle, arcEndAngle, isClockWise);
}

// возвращает ArcData в виде дуги c:
// центром в center
// радиусом radius
// началом на startAngle концом на endAngle ( 0...360 )
// clockWise - по часовой стрелке
// и выходной точки дуги
ArcData getSimpleArc(LatLng center, double radius, double startAngle, double endAngle, bool isClockwise) {
  final List<LatLng> arcPoints = []; // точки дуги

  if (!isClockwise) {
    final double temp = startAngle;
    startAngle = endAngle;
    endAngle = temp;
  }

  final LatLng startPoint = _haversine.offset(center, radius, bearingFromCourse(startAngle));
  final LatLng endPoint = _haversine.offset(center, radius, bearingFromCourse(endAngle));

  arcPoints.add(startPoint);

  if (startAngle < endAngle) {
    arcPoints.addAll(getCwArcPoints(center, radius, startAngle, endAngle));
  } else {
    arcPoints.addAll(getCwArcPoints(center, radius, startAngle, 360.0));
    arcPoints.addAll(getCwArcPoints(center, radius, 0.0, endAngle));
  }

  arcPoints.add(endPoint);

  final Polyline arc = Polyline(
    points: arcPoints,
    color: Colors.green,
    strokeWidth: 5,
  );

  final LatLng last = isClockwise ? endPoint : startPoint;
  return ArcData(arc, last);
}

List<LatLng> getCwArcPoints(LatLng center, double radius, double startAngle, double endAngle) {
  final List<LatLng> arcPoints = [];
  final LatLng startPoint = _haversine.offset(center, radius, bearingFromCourse(startAngle));
  final LatLng endPoint = _haversine.offset(center, radius, bearingFromCourse(endAngle));
  arcPoints.add(startPoint);

  const double sectorAngle = 8;

  double arcPointAngle = startAngle;
  while (arcPointAngle < endAngle - sectorAngle) {
    arcPointAngle += sectorAngle;

    final LatLng point = _haversine.offset(center, radius, bearingFromCourse(arcPointAngle));

    arcPoints.add(point);
  }

  arcPoints.add(endPoint);
  return arcPoints;
}
