// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:sidmap/transition_data.dart';

const Haversine _haversine = Haversine();

/// !!!! TODO get from airport data
double magvar = 7; //URKA

LatLng caLegEndPoint(LatLng startPoint, TransitionData transitionData) {
  int mCourse = transitionData.mCourse;
  String minAlt = transitionData.minAlt;
  double caLength = 0;
  try {
    caLength = double.parse(minAlt) * 6;
  } catch (e) {
    debugPrint("CA Min Alt not number : $minAlt");
    debugPrint("$e");
  }
  double bearing = mCourse > 180 ? (215.0 - 360.0 + magvar) : mCourse + magvar;

  LatLng endPoint = _haversine.offset(startPoint, caLength, bearing);

  return endPoint;
}

LatLng dfLegEndPoint(LatLng startPoint, TransitionData transitionData) {
  String fixType = transitionData.fixType;
  String fixId = transitionData.fixId;

  // TODO get FIX coords from DB
  LatLng KA019 = const LatLng(44.879778, 37.190972);
  LatLng KA020 = const LatLng(44.919444, 37.113333);
  LatLng DIBAT = const LatLng(44.573056, 37.258333);
  LatLng NALUD = const LatLng(44.479722, 37.403611);
  LatLng TUNOT = const LatLng(44.716389, 37.398333);

// LMM 04	44.986556  37.327278
// LMM 22	45.018889  37.368556
  LatLng DER04 = const LatLng(45.018889, 37.368556);
  LatLng SORUL = const LatLng(45.383056, 37.348333);
  LatLng TIBET = const LatLng(45.35, 37.133333);
  LatLng ARNAD = const LatLng(45.383056, 37.348333);

  debugPrint('FIX ID : $fixId');

  if (fixId == 'KA019_URKA') return KA019;
  if (fixId == 'KA020_URKA') return KA020;
  if (fixId == 'NALUD_UR') return NALUD;
  if (fixId == 'DIBAT_UR') return DIBAT;
  if (fixId == 'TUNOT_UR') return TUNOT;

  if (fixId == 'DER04_URKA') return DER04;
  if (fixId == 'SORUL_UR') return SORUL;
  if (fixId == 'TIBET_UR') return TIBET;

  return KA019;
}
