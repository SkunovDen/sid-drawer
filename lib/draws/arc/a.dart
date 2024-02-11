import 'package:flutter/cupertino.dart';
import 'package:geodesy/geodesy.dart';

class ArcNew {
  late final LatLng startPoint;
  late final double startCourse;

  late final LatLng endPoint;
  late final double endCourse;

  late final double radius;

  ArcNew from(LatLng startPoint) {
    this.startPoint = startPoint;
    return this;
  }

  ArcNew withStartCourse(double startCourse) {
    this.startCourse = startCourse;
    return this;
  }

  ArcNew toEndCourse(double endCourse) {
    this.endCourse = endCourse;
    return this;
  }

  ArcNew withRadius(double radius) {
    this.radius = radius;
    return this;
  }

  List<LatLng> clockWise() {
    cwArcCreate();
    return <LatLng>[
      startPoint,
      LatLng(startPoint.latitude + 0.1, startPoint.longitude + 0.1)
    ];
  }


  void cwArcCreate(){
    // определим размер угла арки в градусах
    // = количество сегментов
    double arcAngle;
    if(startCourse < endCourse){
      arcAngle = endCourse - startCourse;
    } else {
      arcAngle = 360 - startCourse + endCourse;
    }

    debugPrint('Угол дуги = $arcAngle');
  }
}
