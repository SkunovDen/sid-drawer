import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:sidmap/sid_data.dart';
import 'package:sidmap/transition_data.dart';
import 'package:sidmap/transition_to_point.dart';

class Sid {
  late SidData sidData;

  Sid(this.sidData);

  Polyline getLegPolyline(current, end) {
    return Polyline(
      points: [current, end],
      color: Colors.blue,
      strokeWidth: 5,
    );
  }

  List<Polyline> getSidPolyline() {
    // список точек SIDа
    List<LatLng> sidPoints = [sidData.startPoint];

    late LatLng currentPoint = sidData.startPoint;

    // берем каждую трансишн
    for (TransitionData transition in sidData.transitions) {
      String path = transition.path;
      late LatLng next;

      // проверяем тип, находим следующую точку
      switch (path) {
        case "CA":
          {
            next = caLegEndPoint(currentPoint, transition);
          }
          break;
        case "DF":
          {
            next = dfLegEndPoint(currentPoint, transition);
          }
          break;
// TODO TEMPORARY
        case "TF":
          {
            next = dfLegEndPoint(currentPoint, transition);
          }
          break;

        default:
          {}
      }

      // добавляем в список
      sidPoints.add(next);
      currentPoint = next;
    }

    // TODO remove debug
    int points = sidPoints.length;
    debugPrint("[sid.dart] :: Find $points SID POINTS");

    List<Polyline> newPolylinesList = [];
    double bearingCurrent = 0;

    for (var i = 0; i < points - 1; i++) {
      LatLng currentPoint = sidPoints[i];
      LatLng nextPoint = sidPoints[i + 1];
      newPolylinesList.add(getLegPolyline(currentPoint, nextPoint));
      double bearingToNext = Geolocator.bearingBetween(currentPoint.latitude,
          currentPoint.longitude, nextPoint.latitude, nextPoint.longitude);
      double bearingChange = bearingCurrent - bearingToNext;
      debugPrint('Bearing to next change: $bearingChange');
      if (bearingChange > 90) {
        debugPrint("A R C");
      }
      bearingCurrent = bearingToNext;
    }
    // TODO remove debug
    int polylines = newPolylinesList.length;
    debugPrint("[sid.dart] :: Collect $polylines SID POLYLINES");

    return newPolylinesList;
  }
}
