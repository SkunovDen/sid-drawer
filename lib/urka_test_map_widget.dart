// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sidmap/urka/urka_04_sid.dart';

import './testSidsData.dart';
import './arc.dart';

class UrkaDibat1FMapWidget extends StatelessWidget {
  const UrkaDibat1FMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Polyline> polylinesList = [];




    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 850,
          height: 640,
          color: Colors.red,
          child: FlutterMap(
            options: const MapOptions(
              // ignore: deprecated_member_use
              center: LatLng(45.0, 37.345),
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
                    backgroundColor: Colors.blueGrey,
                    shadowColor: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0)),
                    minimumSize: const Size(200, 50),
                  ),
                  onPressed: () {
                    polylinesList
                        .addAll(getSid("URKA_DIBA1F"));
                  },
                  child: const Text('TEST SID')),
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
                    polylinesList
                        .addAll(getSid("URKA_DIBA1F"));
                  },
                  child: const Text('URKA DIBAT 1F')),
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
                    polylinesList
                        .addAll(getSid("URKA_DIBA1E"));
                  },
                  child: const Text('URKA DIBAT 1E')),
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
                    polylinesList
                        .addAll(getSid("URKA_GAMA1E"));
                  },
                  child: const Text('URKA GAMAN 1E')),
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
                    polylinesList
                        .addAll(getSid("URKA_PALE1E"));
                  },
                  child: const Text('URKA PALER 1E')),
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
                    polylinesList
                        .addAll(getSid("URKA_ARNA1C"));
                  },
                  child: const Text('URKA ARNAD 1C')),
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shadowColor: Colors.greenAccent,
                    elevation: 13,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0)),
                    minimumSize: const Size(200, 50),
                  ),
                  onPressed: () {
                    polylinesList.clear();
                  },
                  child: const Text('CLEAR')),
            ),


          ],
        )
      ],
    );
  }
}
