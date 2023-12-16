// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'draws/arc/newarc.dart';

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
      final double arcStartCourse = 0;
      final double arcEndCourse = 270;
      final double arcRadius = 4000;
      final bool isCW = true;

      List<LatLng> arcPoints = Arc.arcFromPointToCourse(
          startPoint: arcStartPoint,
          startCourse: arcStartCourse,
          radius: 4000,
          isClockWise: true,
          endCourse: arcEndCourse);

      Polyline arcR =
          Polyline(points: arcPoints, color: Colors.blue, strokeWidth: 5);


      polylinesList.addAll([arcR]);

      List<LatLng> arcPoints2 = Arc.arcFromPointToCourse(
          startPoint: arcStartPoint,
          startCourse: arcStartCourse,
          radius: 4000,
          isClockWise: false,
          endCourse: arcEndCourse);

      Polyline arcL =
          Polyline(points: arcPoints, color: Colors.red, strokeWidth: 5);



      // polylinesList.addAll([arcL]);
    }

    /// Testing functional

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 700,
          height: 600,
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
