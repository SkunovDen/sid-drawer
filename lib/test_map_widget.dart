import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'draws/arc/a.dart';
import 'draws/cut_angle.dart';

class TestMapWidget extends StatelessWidget {
  const TestMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const LatLng arcStartPoint = LatLng(45, 38);
    const LatLng arcEndPoint = LatLng(45.5, 40);
    const LatLng arcCrossPoint = LatLng(45, 39);

    Polyline startLine = Polyline(points: [
      arcStartPoint,
      LatLng(arcStartPoint.latitude, arcStartPoint.longitude - 0.5)
    ], color: Colors.green, strokeWidth: 5);
    Polyline endLine = Polyline(points: [
      arcEndPoint,
      LatLng(arcEndPoint.latitude + 0.5, arcEndPoint.longitude)
    ], color: Colors.green, strokeWidth: 5);
    List<Polyline> polylinesList = [startLine, endLine];

    /// Testing functional ///

    void addTestDraw() {

      Polyline newArcPoly1 = Polyline(
          points: [arcStartPoint, arcCrossPoint, arcEndPoint],
          color: Colors.blue,
          strokeWidth: 5);

      polylinesList.add(newArcPoly1);
    }

    void testFunc() {
      final List<LatLng> cut =
          cutAngle(arcStartPoint, arcCrossPoint, arcEndPoint);

      Polyline newArcPoly1 =
          Polyline(points: [...cut], color: Colors.red, strokeWidth: 5);

      polylinesList.add(newArcPoly1);
    }

    void testArc() {
      final List<LatLng> arc = ArcNew()
          .from(arcStartPoint)
          .withStartCourse(29)
          .toEndCourse(5)
          .withRadius(4500)
          .clockWise();
      Polyline newArcPoly1 =
          Polyline(points: [...arc], color: Colors.blue, strokeWidth: 5);
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
                    testFunc();
                  },
                  child: const Text('TEST FUNC')),
            ),
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
                    testArc();
                  },
                  child: const Text('TEST ARC')),
            ),
          ],
        )
      ],
    );
  }
}
