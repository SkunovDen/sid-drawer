import 'package:latlong2/latlong.dart';
import 'package:geodesy/geodesy.dart';

List<LatLng> vfrTurnsCalc(LatLng thr1, LatLng thr2, String direction) {
  List<LatLng> turns = [thr2];
  final geodesy = Geodesy();
  final LatLng rwCenter = geodesy.midPointBetweenTwoGeoPoints(thr1, thr2);
  final double course =
      geodesy.bearingBetweenTwoGeoPoints(thr1, thr2).toDegrees();

  final double crossWindCourse = course - 90;
  final double backCourse = (course + 180) % 360;
  final double baseCourse = course + 90;

  final LatLng turn1 = Haversine().offset(rwCenter, 1000, course);
  final LatLng turn2 = Haversine().offset(turn1, 1000, crossWindCourse);
  final LatLng traverse = Haversine().offset(rwCenter, 1000, crossWindCourse);
  final LatLng turn4 = Haversine().offset(rwCenter, 1000, backCourse);
  final LatLng turn3 = Haversine().offset(turn4, 1000, crossWindCourse);

  turns.add(turn1);
  turns.add(turn2);
  turns.add(traverse);
  turns.add(turn3);
  turns.add(turn4);
  turns.add(thr1);

  return turns;
}
