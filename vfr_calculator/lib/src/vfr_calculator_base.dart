import 'package:geodesy/geodesy.dart';

/// Transformation the course (0...360) to bearing (-180... 180).
///
/// Given double [course], this function calculates and returns the
/// double value bearing.
double courseToBearing({required double course}){
  double bearing = course;
  if(course > 180) bearing = course - 360;
  return bearing;
}


/// Вычисление координат точек разворотов схемы визуального полета по кругу.
/// [threshold1] - координаты посадочного порога,
/// [threshold2] - координаты порога убытия,
/// [direction] - строковое значение 'L' или 'R', направление движения по схеме.
/// Возвращает массив List<LatLng> в порядке:
/// \[ threshold1, 1-й разворот, 2-й разворот, 3-й разворот,4-й разворот, threshold2 \].
List<LatLng> vfrTurnsCalc({required LatLng threshold1, required LatLng threshold2, required String direction}) {
  List<LatLng> turns = [threshold2];
  final geodesy = Geodesy();
  final LatLng rwCenter = geodesy.midPointBetweenTwoGeoPoints(threshold1, threshold2);
  final double upwindCourseBearing = geodesy.bearingBetweenTwoGeoPoints(threshold1, threshold2).toDouble();

  final double crossWindCourseBearing = courseToBearing(course: upwindCourseBearing - 90);
  final double backCourseBearing = courseToBearing(course: (upwindCourseBearing + 180) % 360);
  final double baseCourseBearing = courseToBearing(course: upwindCourseBearing + 90);

  final LatLng turn1 = Haversine().offset(rwCenter, 1000, courseToBearing(course: upwindCourseBearing));
  final LatLng turn2;
  final LatLng traverse;
  final LatLng turn4 = Haversine().offset(rwCenter, 1000, courseToBearing(course: backCourseBearing));
  final LatLng turn3;

  if (direction == 'R') {
    turn2 = Haversine().offset(turn1, 1000, courseToBearing(course: crossWindCourseBearing));
    traverse = Haversine().offset(rwCenter, 1000, courseToBearing(course: crossWindCourseBearing));
    turn3 = Haversine().offset(turn4, 1000, courseToBearing(course: crossWindCourseBearing));
  } else {
    turn2 = Haversine().offset(turn1, 1000, courseToBearing(course: baseCourseBearing));
    traverse = Haversine().offset(rwCenter, 1000, courseToBearing(course: baseCourseBearing));
    turn3 = Haversine().offset(turn4, 1000, courseToBearing(course: baseCourseBearing));
  }
  turns.add(turn1);
  turns.add(turn2);
  turns.add(traverse);
  turns.add(turn3);
  turns.add(turn4);
  turns.add(threshold1);

  return turns;
}
