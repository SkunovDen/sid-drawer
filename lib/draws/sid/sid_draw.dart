import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sidmap/data/arc_data.dart';
import 'package:sidmap/data/sid_line_data.dart';
import 'package:sidmap/draws/arc/arc.dart';
import 'package:sidmap/draws/helpers/arc_helpers.dart';

List<Polyline> getSidDraw(SidLineData sidLineData) {
  List<Polyline> result = [];
  LatLng startPoint = sidLineData.startPoint.point;

  LatLng currentLinePoint = startPoint;
  double currentCourse = sidLineData.startCourse;

  // проходимся по всм точкам в SidLineData
  for (var sidPoint in sidLineData.sidPoints) {
    double courseToNext = courseBetween(currentLinePoint, sidPoint.point);
    double turnAngle = (currentCourse - courseToNext);


    debugPrint('Turn to $turnAngle');
    // Если нужна арка - добавляем арку
    if(turnAngle.abs() > 23) {
      // TODO получить из даннных
      bool isClockWise = turnAngle < 0;

      // TODO рассчитать ?
      double turnRadius = 1500.0;

      ArcData arcData = getTurnArc(
          currentLinePoint, currentCourse,
          turnRadius,
          courseToNext, isClockWise);

      result.add(arcData.arc);

      currentLinePoint = LatLng(arcData.lastPoint.latitude, arcData.lastPoint.longitude);
    }

    // добавляем линию до следующей точки
    Polyline transitionPolyline = Polyline(
      points: [currentLinePoint, sidPoint.point],
      color: Colors.green,
      strokeWidth: 5,
    );

    currentLinePoint = sidPoint.point;
    currentCourse = courseToNext;

    result.add(transitionPolyline);
  }

  return result;
}
