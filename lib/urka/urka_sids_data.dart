import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../star_w.dart';
import './urka_sid_helpers.dart';


List<Polyline> getDibat1f(LatLng startPoint){
  List<Polyline> dibat1f = [];
  // C
  LatLng current = startPoint;
  double mCourse = 215;
  double minAltFt = 580.0;

  LatLng pointTo = caPoint(current, mCourse, minAltFt);
  Polyline ca = Polyline(
  points: [current, pointTo],
  color: Colors.blue,
  strokeWidth: 5,
  );
  dibat1f.add(starW(pointTo));

  // DF - 1
  current = LatLng(pointTo.latitude, pointTo.longitude);

  pointTo = dfPoint(current, "KA019_URKA", "");
  Polyline df1 = Polyline(
  points: [current, pointTo],
  color: Colors.blue,
  strokeWidth: 5,
  );
  dibat1f.add(starW(pointTo));

  // DF - 2
  current = LatLng(pointTo.latitude, pointTo.longitude);

  pointTo = dfPoint(current, "DIBAT_UK", "FL050");
  Polyline df2 = Polyline(
  points: [current, pointTo],
  color: Colors.blue,
  strokeWidth: 5,
  );
  dibat1f.add(starW(pointTo));

  dibat1f.add(ca);
  dibat1f.add(df1);
  dibat1f.add(df2);

  return dibat1f;
}

List<Polyline> getDibat1e(LatLng startPoint){
  // [{"path":"DF","fixType":"wp","fixId":"DER04_URKA","minAlt":""},
  //   {"path":"CA","mCourse":35,"minAlt":"01200"},
  //   {"path":"DF","fixType":"wp","fixId":"KA020_URKA","minAlt":""},
  //   {"path":"TF","fixType":"wp","fixId":"DIBAT_UR","minAlt":"FL050"}
  // ]
  List<Polyline> dibat1e = [];


  //DF - 0
  LatLng current = LatLng(startPoint.latitude, startPoint.longitude);

  LatLng pointTo = dfPoint(current, "DER04_URKA", "");
  Polyline df0 = Polyline(
    points: [current, pointTo],
    color: Colors.blue,
    strokeWidth: 5,
  );


  // CA
  current = LatLng(pointTo.latitude, pointTo.longitude);
  double mCourse = 35;
  double minAltFt = 1200.0;

  pointTo = caPoint(current, mCourse, minAltFt);
  Polyline ca = Polyline(
    points: [current, pointTo],
    color: Colors.blue,
    strokeWidth: 5,
  );
  dibat1e.add(starW(pointTo));

  // DF - 1
  current = LatLng(pointTo.latitude, pointTo.longitude);

  pointTo = dfPoint(current, "KA020_URKA", "");
  Polyline df1 = Polyline(
    points: [current, pointTo],
    color: Colors.blue,
    strokeWidth: 5,
  );
  dibat1e.add(starW(pointTo));

  // DF - 2
  current = LatLng(pointTo.latitude, pointTo.longitude);

  pointTo = dfPoint(current, "DIBAT_UK", "FL050");
  Polyline df2 = Polyline(
    points: [current, pointTo],
    color: Colors.blue,
    strokeWidth: 5,
  );
  dibat1e.add(starW(pointTo));

  dibat1e.add(df0);
  dibat1e.add(ca);
  dibat1e.add(df1);
  dibat1e.add(df2);

  return dibat1e;
}

List<Polyline> getGaman1e(LatLng startPoint){
  // [{"path":"DF","fixType":"wp","fixId":"DER04_URKA","minAlt":""},
  // {"path":"CA","mCourse":35,"minAlt":"01200"},
  // {"path":"DF","fixType":"wp","fixId":"KA023_URKA","minAlt":"FL060"},
  // {"path":"TF","fixType":"wp","fixId":"GAMAN_UK","minAlt":"FL100"}
  // ]

  List<Polyline> gaman1e = [];


  //DF - 0
  LatLng current = LatLng(startPoint.latitude, startPoint.longitude);

  LatLng pointTo = dfPoint(current, "DER04_URKA", "");
  Polyline df0 = Polyline(
    points: [current, pointTo],
    color: Colors.blue,
    strokeWidth: 5,
  );


  // CA
  current = LatLng(pointTo.latitude, pointTo.longitude);
  double mCourse = 35;
  double minAltFt = 1200.0;

  pointTo = caPoint(current, mCourse, minAltFt);
  Polyline ca = Polyline(
    points: [current, pointTo],
    color: Colors.blue,
    strokeWidth: 5,
  );  gaman1e.add(starW(pointTo));


  // DF - 1
  current = LatLng(pointTo.latitude, pointTo.longitude);

  pointTo = dfPoint(current, "KA023_URKA", "");
  Polyline df1 = Polyline(
    points: [current, pointTo],
    color: Colors.blue,
    strokeWidth: 5,
  );
  gaman1e.add(starW(pointTo));

  // DF - 2
  current = LatLng(pointTo.latitude, pointTo.longitude);

  pointTo = dfPoint(current, "GAMAN_UK", "FL060");
  Polyline df2 = Polyline(
    points: [current, pointTo],
    color: Colors.blue,
    strokeWidth: 5,
  );
  gaman1e.add(starW(pointTo));

  gaman1e.add(df0);
  gaman1e.add(ca);
  gaman1e.add(df1);
  gaman1e.add(df2);

  return gaman1e;
}

List<Polyline> getPaler1e(LatLng startPoint){
  // [{"path":"DF","fixType":"wp","fixId":"DER04_URKA","minAlt":""},
  // {"path":"CA","mCourse":35,"minAlt":"01200"},
  // {"path":"DF","fixType":"wp","fixId":"KA022_URKA","minAlt":"FL060"},
  // {"path":"TF","fixType":"wp","fixId":"PALER_UK","minAlt":"FL100"}]

  List<Polyline> dibat1e = [];


  //DF - 0
  LatLng current = LatLng(startPoint.latitude, startPoint.longitude);

  LatLng pointTo = dfPoint(current, "DER04_URKA", "");
  Polyline df0 = Polyline(
    points: [current, pointTo],
    color: Colors.blue,
    strokeWidth: 5,
  );

  // CA
  current = LatLng(pointTo.latitude, pointTo.longitude);
  double mCourse = 35;
  double minAltFt = 1200.0;

  pointTo = caPoint(current, mCourse, minAltFt);
  Polyline ca = Polyline(
    points: [current, pointTo],
    color: Colors.blue,
    strokeWidth: 5,
  );
  dibat1e.add(starW(pointTo));


  // DF - 1
  current = LatLng(pointTo.latitude, pointTo.longitude);

  pointTo = dfPoint(current, "KA022_URKA", "");
  Polyline df1 = Polyline(
    points: [current, pointTo],
    color: Colors.blue,
    strokeWidth: 5,
  );
  dibat1e.add(starW(pointTo));


  // DF - 2
  current = LatLng(pointTo.latitude, pointTo.longitude);

  pointTo = dfPoint(current, "PALER_UK", "FL050");
  Polyline df2 = Polyline(
    points: [current, pointTo],
    color: Colors.blue,
    strokeWidth: 5,
  );
  dibat1e.add(starW(pointTo));


  dibat1e.add(df0);
  dibat1e.add(ca);
  dibat1e.add(df1);
  dibat1e.add(df2);

  return dibat1e;
}

List<Polyline> getArnad1C(LatLng startPoint){
  // [{"path":"DF","fixType":"wp","fixId":"DER04_URKA","minAlt":""},
  // {"path":"CA","mCourse":35,"minAlt":"01200"},
  // {"path":"DF","fixType":"ndb","fixId":"AN_UR","minAlt":""},
  // {"path":"TF","fixType":"wp","fixId":"D303M_URKA","minAlt":"FL050"},
  // {"path":"TF","fixType":"wp","fixId":"ARNAD_UK","minAlt":"FL100"}]

  List<Polyline> arnad1c = [];


  //DF - 0
  LatLng current = LatLng(startPoint.latitude, startPoint.longitude);

  LatLng pointTo = dfPoint(current, "DER04_URKA", "");
  Polyline df0 = Polyline(
    points: [current, pointTo],
    color: Colors.blue,
    strokeWidth: 5,
  );

  // CA
  current = LatLng(pointTo.latitude, pointTo.longitude);
  double mCourse = 35;
  double minAltFt = 1200.0;

  pointTo = caPoint(current, mCourse, minAltFt);
  Polyline ca = Polyline(
    points: [current, pointTo],
    color: Colors.blue,
    strokeWidth: 5,
  );
  arnad1c.add(starW(pointTo));

  // DF - 1
  current = LatLng(pointTo.latitude, pointTo.longitude);

  pointTo = dfPoint(current, "AN_UR", "");
  Polyline df1 = Polyline(
    points: [current, pointTo],
    color: Colors.blue,
    strokeWidth: 5,
  );
  arnad1c.add(starW(pointTo));

  // DF - 2
  current = LatLng(pointTo.latitude, pointTo.longitude);

  pointTo = dfPoint(current, "D303M_URKA", "FL050");
  Polyline df2 = Polyline(
    points: [current, pointTo],
    color: Colors.blue,
    strokeWidth: 5,
  );
  arnad1c.add(starW(pointTo));

  // DF - 3
  current = LatLng(pointTo.latitude, pointTo.longitude);

  pointTo = dfPoint(current, "ARNAD_UK", "FL050");
  Polyline df3 = Polyline(
    points: [current, pointTo],
    color: Colors.blue,
    strokeWidth: 5,
  );
  arnad1c.add(starW(pointTo));


  arnad1c.add(df0);
  arnad1c.add(ca);
  arnad1c.add(df1);
  arnad1c.add(df2);
  arnad1c.add(df3);

  return arnad1c;
}

