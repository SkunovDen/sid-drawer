import 'package:latlong2/latlong.dart';
import 'package:sidmap/data/sid_line_data.dart';
import 'package:sidmap/data/sid_point_data.dart';
import 'package:sidmap/draws/helpers/arc_helpers.dart';
import './urka_points_test_data.dart';

SidLineData getSidData(String sidId){
  //DIBAT 1F
  // [{"path":"CA","mCourse":215,"minAlt":"00580"},
  // {"path":"DF","fixId":"KA019_URKA","fly":"over"},
  // {"path":"DF","fixId":"DIBAT_UR","minAlt":"FL050","fly":"by"}]

  LatLng start = const LatLng(44.993783, 37.336617);  // URKA THR RW22

  SidPointData startPoint = SidPointData(
      start,  // URKA THR RW22
      true,
      "START"
      );
  double startCourse = 215 + 7.0;

  LatLng ca580point = const Haversine().offset(start, 580, bearingFromCourse(215 + 7));

  SidPointData ca580data = SidPointData(ca580point, true, "CA_POINT");
  SidPointData ka019data = SidPointData(KA019_URKA, true, "POINT");
  SidPointData dibat = SidPointData(DIBAT_UR, true, "END_POINT");


  SidLineData dibat1F = SidLineData(
      startPoint,
      startCourse,
      [ca580data, ka019data, dibat]);

  return dibat1F;
}