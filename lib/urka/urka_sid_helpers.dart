import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../arc.dart';
import '../utils.dart';




LatLng caPoint(LatLng startPoint, double mCourse, double minAltFt){
  double caLineLength = caLengthMeters(minAltFt);
  double magVar = 7.0;

  return const Haversine().offset(startPoint, caLineLength, courseToBearing(mCourse + magVar));
}

LatLng dfPoint(LatLng startPoint, String fixId, String minAltString){
  // Get fix data from DB :
//   {
//     "aw_points": [
// {
//   "obj_id" : "KA019_URKA",
//   "code" : "KA019",
//   "lng" : 37.190972,
//   "lat" : 44.879778,
// }
//   ]}

  // "DIBAT_UR"
//   {
//     "aw_points": [
// {
//   "obj_id" : "DIBAT_UR",
//   "code" : "DIBAT",

//   "lng" : 37.258333,
//   "lat" : 44.573056,

//   ]}


  LatLng KA019_URKA = const LatLng(44.879778, 37.190972);


  LatLng DER04_URKA = const LatLng(45.010463888889, 37.357916666667);
  LatLng KA020_URKA = const LatLng(44.919444, 37.113333);
  LatLng KA021_URKA = const LatLng(45.176111, 37.145944);

  LatLng KA022_URKA = const LatLng(45.1165, 37.073917);
  LatLng KA023_URKA = const LatLng(45.055889, 37.039194);
  LatLng D303M_URKA = const LatLng(45.108111, 37.064139);
  LatLng AN_UR = const LatLng(44.967889, 37.303722);

  LatLng GAMAN_UK = const LatLng(45.0, 36.591667);
  LatLng PALER_UK = const LatLng(45.153333, 36.545);


  LatLng DIBAT_UK = const LatLng(44.573056, 37.258333);
  LatLng ARNAD_UK = const LatLng(45.35, 36.646667);


  if (fixId =='KA019_URKA') return KA019_URKA;
  if (fixId =='KA020_URKA') return KA020_URKA;
  if (fixId =='KA021_URKA') return KA021_URKA;
  if (fixId =='KA022_URKA') return KA022_URKA;
  if (fixId =='KA023_URKA') return KA023_URKA;

  if (fixId =='D303M_URKA') return D303M_URKA;
  if (fixId =='AN_UR') return AN_UR;

  if (fixId =='DIBAT_UK') return DIBAT_UK;
  if (fixId =='PALER_UK') return PALER_UK;
  if (fixId =='GAMAN_UK') return GAMAN_UK;
  if (fixId =='ARNAD_UK') return ARNAD_UK;

  if (fixId =='DER04_URKA') return DER04_URKA;
  if (fixId =='AN_UR') return AN_UR;

  return const LatLng(0, 0);
}


// Возвращает дугу с началом в точке startPoint
//
Polyline addArc(String clockWise, LatLng startPoint, double angle){
  List<LatLng> arcPoints = [];
  arcPoints.add(startPoint);




  return Polyline(
    points: arcPoints,
    color: Colors.blue,
    strokeWidth: 2,
  );
}