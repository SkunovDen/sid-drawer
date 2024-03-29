import 'package:flutter/cupertino.dart';
import 'package:geodesy/geodesy.dart';
import 'package:sidmap/draws/arc/arc_helpers.dart';

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
    return  cwArcCreate();
  }

  List<LatLng> counterClockWise() {
    return  counterCwArcCreate();
  }


  List<LatLng> cwArcCreate(){
    List<LatLng> arcPointsList = [startPoint];

    // определим размер угла арки в градусах
    // = количество сегментов
    double arcAngle;
    if(startCourse < endCourse){
      arcAngle = endCourse - startCourse;
    } else {
      arcAngle = 360 - startCourse + endCourse;
    }

    // центр дуги
    double courseToArcCenter = turnToRight90(startCourse);
    if(courseToArcCenter > 180) courseToArcCenter -= 360.0;
    LatLng arcCenter = const Haversine().offset(startPoint, radius, courseToArcCenter);

    double courseToEndFromCenter = turnToLeft90(endCourse);
    if(courseToEndFromCenter > 180) courseToEndFromCenter -= 360.0;
    LatLng endPoint = const Haversine().offset(arcCenter, radius, courseToEndFromCenter);

    double angleFromCenterToArcPoint = turnToLeft90(startCourse);

    for(int i = 0; i < arcAngle; i++){
      if(angleFromCenterToArcPoint > 180) angleFromCenterToArcPoint -= 360.0;

      LatLng arcPoint = const Haversine().offset(arcCenter, radius, angleFromCenterToArcPoint);
      arcPointsList.add(arcPoint);
      angleFromCenterToArcPoint += 1.0;
    }


    return[...arcPointsList, endPoint];
  }

  List<LatLng> counterCwArcCreate(){
    List<LatLng> arcPointsList = [startPoint];

    // определим размер угла арки в градусах
    // = количество сегментов
    double arcAngle;
    if(startCourse > endCourse){
      arcAngle = startCourse - endCourse;
    } else {
      arcAngle = 360 - endCourse + startCourse;
    }

    // центр дуги
    double courseToArcCenter = turnToLeft90(startCourse);
    if(courseToArcCenter > 180) courseToArcCenter -= 360.0;
    LatLng arcCenter = const Haversine().offset(startPoint, radius, courseToArcCenter);

    double courseToEndFromCenter = turnToRight90(endCourse);
    if(courseToEndFromCenter > 180) courseToEndFromCenter -= 360.0;
    LatLng endPoint = const Haversine().offset(arcCenter, radius, courseToEndFromCenter);

    double angleFromCenterToArcPoint = turnToRight90(startCourse);

    for(int i = 0; i < arcAngle; i++){
      if(angleFromCenterToArcPoint < -180) angleFromCenterToArcPoint += 360.0;

      LatLng arcPoint = const Haversine().offset(arcCenter, radius, angleFromCenterToArcPoint);
      arcPointsList.add(arcPoint);
      angleFromCenterToArcPoint -= 1.0;
    }


    return[...arcPointsList, endPoint];
  }
}
