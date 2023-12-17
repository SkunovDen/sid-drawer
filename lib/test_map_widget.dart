// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sidmap/data/sid_line_data.dart';
import 'package:sidmap/data/test_data.dart';
import 'package:sidmap/draws/arc/arcPoint.dart';
import 'package:sidmap/draws/sid/sid_draw.dart';

import './draws/runway/draw_runway.dart';
import 'draws/arc/arc.dart';
import 'draws/arc/new_arc.dart';

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
      final double arcStartCourse = 90;
      final double arcEndCourse = 270;
      final double arcRadius = 4000;
      final bool clockWise = true;

      final ArcPoint start =
          ArcPoint(coordinates: arcStartPoint, trueCourse: arcStartCourse);

      List<LatLng> arcPoints1 =
          arcFromPointToCourse(start, 4000, clockWise, arcEndCourse);

      Polyline arcTrue =
          Polyline(points: arcPoints1, color: Colors.red, strokeWidth: 5);

      final List<LatLng> newArc = Arc.fromPointToCourse(
          startPoint: arcStartPoint,
          startCourse: arcStartCourse,
          outCourse: arcEndCourse,
          radius: arcRadius,
          isCw: clockWise);

      // const LatLng sPoint = LatLng(44.8, 36.9);
      // newArc.add(sPoint);

      Polyline newArcPoly =
          Polyline(points: newArc, color: Colors.blue, strokeWidth: 5);

      polylinesList.add(newArcPoly);
      // polylinesList.add(arcFalse);
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
