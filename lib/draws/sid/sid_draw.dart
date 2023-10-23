import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sidmap/data/sid_line_data.dart';

List<Polyline> getSidDraw(SidLineData sidLineData) {
  List<Polyline> result = [];

  LatLng currentLinePoint = sidLineData.startPoint.point;

  for (var sidPoint in sidLineData.sidPoints) {
    Polyline transitionPolyline = Polyline(
      points: [currentLinePoint, sidPoint.point],
      color: Colors.green,
      strokeWidth: 5,
    );

    currentLinePoint = sidPoint.point;

    result.add(transitionPolyline);
  }

  return result;
}
