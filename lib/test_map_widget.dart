// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sidmap/draws/arc/arc_helpers.dart';

import 'draws/arc/new_arc.dart';
import 'dart:math';

class TestMapWidget extends StatelessWidget {
  const TestMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const LatLng arcStartPoint = LatLng(45, 38);

    Polyline startLine = Polyline(
        points: [const LatLng(45, 37), arcStartPoint],
        color: Colors.green,
        strokeWidth: 5);
    List<Polyline> polylinesList = [startLine];

    /// Testing functional ///

    void addTestDraw() {
      final random = Random();

      const double arcStartCourse = 270;
      const double arcEndCourse = 318;
      const double arcRadius = 3500;
      const bool clockWise = true;
      const LatLng sPoint = LatLng(45.1, 37);
      const LatLng sArkPoint = LatLng(45.1, 37.1);
      const LatLng toArkPoint = LatLng(45.2, 37);

      const LatLng sPoint1 = LatLng(46.1, 39);
      const LatLng sPoint2 = LatLng(46.3, 37);

      // final List<LatLng> newArc = Arc().fromPointToCourse(
      //     startPoint: sArkPoint,
      //     startCourse: 90,
      //     // outCoursePoint: sPoint2,
      //     outCourse: 55,
      //     radius: 4000,
      //     isCw: !clockWise, );

      final List<LatLng> newArcToPoint = Arc().fromPointToCourseToPoint(
        startPoint: sPoint,
        startCourse: arcStartCourse,
        outCoursePoint: toArkPoint,
        // outCourse: 55,
        radius: arcRadius,
        isCw: clockWise, );


      Polyline newArcPoly1 = Polyline(
          points: [sArkPoint,sPoint, ...newArcToPoint, toArkPoint], color: Colors.blue, strokeWidth: 5);

      polylinesList.add(newArcPoly1);
    }

    /// Testing functional

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 700,
          height: 500,
          color: Colors.red,
          child: FlutterMap(
            options: const MapOptions(
              // ignore: deprecated_member_use
              center: LatLng(45.012, 37.355),
              // ignore: deprecated_member_use
              zoom: 8.5,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              PolylineLayer(
                polylines: polylinesList,
              ),
            ],
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(2),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                    shadowColor: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0)),
                    minimumSize: const Size(200, 50),
                  ),
                  onPressed: () {
                    addTestDraw();
                  },
                  child: const Text('TEST DRAW')),
            ),
          ],
        )
      ],
    );
  }
}
