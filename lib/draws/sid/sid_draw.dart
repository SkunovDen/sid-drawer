import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sidmap/data/sid_line_data.dart';
import 'package:sidmap/draws/arc/arc.dart';
import 'package:sidmap/draws/helpers/arc_helpers.dart';

List<Polyline> getSidDraw(SidLineData sidLineData) {
  List<Polyline> result = [];

  // начало линии
  LatLng currentLinePoint = sidLineData.startPoint.point;
  double currentLineCourse = sidLineData.startCourse;

  // проходимся по всм точкам в SidLineData
  for (var sidPoint in sidLineData.sidPoints) {
    // если курс меняется более чем на 45 градусов добавляем дугу:
    double courseToNext = courseBetween(currentLinePoint, sidPoint.point);

    double turnAngle = (currentLineCourse - courseToNext.abs());
    debugPrint('Turn : $turnAngle');

    List<Polyline> transitionPolyline = [];

    if(turnAngle > 45) {
      debugPrint('ARC needed\n');

      transitionPolyline = getTurnArc(currentLinePoint, currentLineCourse,
          3500.0,
          courseToNext, false);




      Polyline transitionPolylineL = Polyline(
        points: [currentLinePoint, sidPoint.point],
        color: Colors.green,
        strokeWidth: 5,
      );

      transitionPolyline.add(transitionPolylineL);

    } else {
      Polyline transitionPoly = Polyline(
        points: [currentLinePoint, sidPoint.point],
        color: Colors.green,
        strokeWidth: 5,
      );

      transitionPolyline.add(transitionPoly);
    }

    currentLinePoint = sidPoint.point;

    result.addAll(transitionPolyline);
  }

  return result;
}
