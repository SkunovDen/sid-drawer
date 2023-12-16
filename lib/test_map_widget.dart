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

class TestMapWidget extends StatelessWidget {
  const TestMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var urkaRw04Thr = const LatLng(45.010463888889, 37.357916666667);
    var urkaRw22Thr = const LatLng(44.993783, 37.336617);

    List<Polyline> polylinesList = [];

    polylinesList.add(getRw(urkaRw04Thr, urkaRw22Thr));

    /// Testing functional ///

    void addTestDraw() {
      const LatLng arcStartPoint = LatLng(45, 38);
      final double arcStartCourse = 10;
      final double arcEndCourse = 130;
      final double arcRadius = 4000;

      final ArcPoint start =
          ArcPoint(coordinates: arcStartPoint, trueCourse: arcStartCourse);

      List<LatLng> arcPoints = arcFromPointToCourse(start, 4000, true, arcEndCourse);
      Polyline arc = Polyline(
          points: arcPoints,
          color: Colors.blue,
          strokeWidth: 5);

      Polyline startLine = Polyline(
          points: [const LatLng(45, 37), arcStartPoint],
          color: Colors.green,
          strokeWidth: 5);

      Polyline engLine = Polyline(
          points: [const LatLng(45.1, 37.7), const LatLng(45.5, 37.7)],
          color: Colors.green,
          strokeWidth: 5);

      polylinesList.addAll([startLine, arc]);
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
