import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sidmap/urka/urka_sids_data.dart';



List<Polyline> getSid(String sidId){

// "airport_id" : "URKA",
// магнитное склонение из данных аэродрома
  LatLng urkaRw04Thr = const LatLng(45.010463888889, 37.357916666667);
  LatLng urkaRw22Thr = const LatLng(44.993783, 37.336617);



  // "runways" : "[\"22\"]",
  // начальная точка из данных SID
  LatLng startPoint = urkaRw22Thr;
  
  List<Polyline> sid = [];
  Polyline urkaRW = getRw(urkaRw04Thr, urkaRw22Thr);
  sid.add(urkaRW);


  if (sidId=="URKA_DIBA1F") sid.addAll(getDibat1f(urkaRw22Thr));
  if (sidId=="URKA_DIBA1E") sid.addAll(getDibat1e(urkaRw04Thr));
  if (sidId=="URKA_GAMA1E") sid.addAll(getGaman1e(urkaRw04Thr));
  if (sidId=="URKA_PALE1E") sid.addAll(getPaler1e(urkaRw04Thr));
  if (sidId=="URKA_ARNA1C") sid.addAll(getArnad1C(urkaRw04Thr));


  return sid;
}





















Polyline getRw(LatLng thr1, LatLng thr2){
  Polyline urkaRw = Polyline(
    points: [
      // const LatLng(44.993783, 37.336617),  // RW22
      const LatLng(44.993783, 37.336617),
      const LatLng(44.993783, 37.336617),

      const LatLng(45.010463888889, 37.357916666667),
      // const LatLng(45.010463888889, 37.357916666667), // RW04
      const LatLng(45.010463888889, 37.357916666667),
      const LatLng(45.010463888889, 37.357916666667)
    ],
    color: Colors.black,
    strokeWidth: 5,
  );

  return urkaRw;
}