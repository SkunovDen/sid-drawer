import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../helpers/arc_helpers.dart';

const Haversine _haversine = Haversine();

// Возвращает дугу, постороенную по:
// входная точка (LatLng),
// входной курс (истинный, 0..360),
// радиус разворота (meters),
// выходной курс  (истинный, 0..360),
// направление (по часовой - true).
List<Polyline> getTurnArc(LatLng startPoint, double currentCourse, double turnRadius,
    double exitCourse, bool isClockWise) {

  double courseL = turnToLeft90(currentCourse);
  double courseR = turnToRight90(currentCourse);

  late double courseToCenter;
  late double arcStartAngle;
  late double arcEndAngle;

  if(isClockWise){

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

  LatLng arcCenter = const Haversine().offset(startPoint, turnRadius, bearingFromCourse(courseToCenter));

  return getSimpleArc(arcCenter, turnRadius, arcStartAngle, arcEndAngle, isClockWise);
}

/// Заглушка для тестов
/// not in use
List<Polyline> getTestArc(LatLng startPoint, double currentCourse) {
  double courseL = turnToLeft90(currentCourse);
  double courseR = turnToRight90(currentCourse);

  double turnRadius = 1500.0;

  LatLng arcCenterL = const Haversine().offset(startPoint, turnRadius, bearingFromCourse(courseL));

  return getSimpleArc(arcCenterL, turnRadius, courseR, courseL, false);
}


// возвращает Polyline в виде дуги c:
// центром в center
// радиусом radius
// началом на startAngle концом на endAngle ( 0...360 )
// clockWise - по часовой стрелке
    List<Polyline> getSimpleArc(LatLng center, double radius, double startAngle,
        double endAngle, bool clockWise) {
      List<LatLng> arcPoints = []; // точки дуги

      if (!clockWise) {
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

      return [arc];
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

