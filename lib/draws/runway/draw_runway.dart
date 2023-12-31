import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

Polyline getRw(LatLng thr1, LatLng thr2){
  Polyline urkaRw = Polyline(
    points: [
      // const LatLng(45.010463888889, 37.357916666667), // THR RW04
      // const LatLng(44.993783, 37.336617),  // THR RW22

      const LatLng(44.993783, 37.336617),
      const LatLng(44.993783, 37.336617),

      const LatLng(45.010463888889, 37.357916666667),

      const LatLng(45.010463888889, 37.357916666667),
      const LatLng(45.010463888889, 37.357916666667)
    ],
    color: Colors.black,
    strokeWidth: 5,
  );

  return urkaRw;
}