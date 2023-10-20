import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

Polyline starW(LatLng point) {
  double latitude = point.latitude;
  double longitude = point.longitude;
  var top = LatLng(latitude + 0.02, longitude);
  var topRight = LatLng(latitude + 0.005, longitude + 0.005);
  var right = LatLng(latitude, longitude + 0.02);
  var botRight = LatLng(latitude - 0.005, longitude + 0.005);
  var bot = LatLng(latitude - 0.02, longitude);
  var botLeft = LatLng(latitude - 0.005, longitude - 0.005);
  var left = LatLng(latitude, longitude - 0.02);
  var topLeft = LatLng(latitude + 0.005, longitude - 0.005);
  Polyline st = Polyline(
    points: [top, topRight, right, botRight, bot, botLeft, left, topLeft, top],
    color: Colors.black,
    strokeWidth: 2,
  );
  return st;
}
