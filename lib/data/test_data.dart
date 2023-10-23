import 'package:latlong2/latlong.dart';
import 'package:sidmap/data/sid_line_data.dart';
import 'package:sidmap/data/sid_point_data.dart';
import 'package:sidmap/draws/helpers/arc_helpers.dart';
import './urka_points_test_data.dart';

SidLineData getSidData(String sidId) {
  //DIBAT 1F
  // [{"path":"CA","mCourse":215,"minAlt":"00580"},
  // {"path":"DF","fixId":"KA019_URKA","fly":"over"},
  // {"path":"DF","fixId":"DIBAT_UR","minAlt":"FL050","fly":"by"}]

  LatLng startPoint = const LatLng(44.993783, 37.336617); // URKA THR RW22

  SidPointData start = SidPointData(
      startPoint, // URKA THR RW22
      true,
      "START");

  LatLng ca580point =
      const Haversine().offset(startPoint, 580, bearingFromCourse(215 + 7));

  SidPointData ca580data = SidPointData(ca580point, true, "CA_POINT");
  SidPointData ka019data = SidPointData(KA019_URKA, true, "POINT");
  SidPointData dibat = SidPointData(DIBAT_UR, true, "END_POINT");
  SidPointData paler = SidPointData(PALER_UR, true, "END_POINT");
  SidPointData arnad = SidPointData(ARNAD_UR, true, "END_POINT");

  SidLineData dibat1F =
      SidLineData(start, 215 + 7, [ca580data, ka019data, dibat, arnad, paler]);

  return dibat1F;
}

SidLineData getArnadSidData(String sidId) {
  //ARNAD 1C
  // [{"path":"DF","fixId":"DER04_URKA","fly":"over"},
  // {"path":"CA","mCourse":35,"minAlt":"01200"},
  // {"path":"DF","fixId":"AN_UR","turnDirection":"L","fly":"over"},
  // {"path":"TF","fixId":"D303M_URKA","minAlt":"FL050","turnDirection":"R","fly":"by"},
  // {"path":"TF","fixId":"ARNAD_UR","minAlt":"FL100","fly":"by"}]

  LatLng startPoint = const LatLng(45.010463888889, 37.357916666667); // THR RW04

  SidPointData start = SidPointData(
      startPoint, // URKA THR RW22
      true,
      "START");

  LatLng ca1200point =
  const Haversine().offset(startPoint, 3200, bearingFromCourse(35 + 7));

  SidPointData der04 = SidPointData(DER04_URKA, true, "END_POINT");
  SidPointData ca1200data = SidPointData(ca1200point, true, "CA_POINT");
  SidPointData anUr = SidPointData(AN_UR, true, "POINT");
  SidPointData d303m = SidPointData(D303M_URKA, true, "END_POINT");
  SidPointData arnad = SidPointData(ARNAD_UR, true, "END_POINT");


  SidLineData dibat1F =
  SidLineData(start, 35 + 7, [ca1200data, anUr, d303m, arnad]);

  return dibat1F;
}
