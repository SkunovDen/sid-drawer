import 'dart:developer';

import 'package:latlong2/latlong.dart';
import 'package:sidmap/draws/helpers/arc_helpers.dart';

class Arc {
  static const _haversine = Haversine();

  static List<LatLng> _fromPointToCourseCW({
    required LatLng startPoint,
    required double startCourse,
    required double outCourse,
    required double radius,
  }) {
    List<LatLng> arcPoints = [];
    log(
        name: 'NEW ARC',
        '>>> Create  "CW"  ARC starts from $startPoint WITH course $startCourse; '
        'with radius $radius;'
        'out course $outCourse');

    // находим центр дуги
    double courseToCenter = turnToRight90(startCourse);
    LatLng center = _haversine.offset(
          startPoint, radius, bearingFromCourse(courseToCenter));



arcPoints.addAll([startPoint, center]);
return arcPoints;

    // CW
    /// пеленг на стартовую точку
    double arcStartCourseFromCenter = turnToLeft90(startCourse);

    /// пеленг на конечную точку
    double arcOutCourseFromCenter = turnToLeft90(outCourse);

    log(
        name: 'NEW ARC',
        '>>> курс на стартовую точку $arcStartCourseFromCenter');
    log(name: 'NEW ARC', '>>> курс на конечную точку $arcOutCourseFromCenter');

    // CW
    // наращиваем  курс до совпадения с конечным
    // собираем точки дуги:
    double currentArcPointCourseFromCenter = arcStartCourseFromCenter;
    double c = 0;
    do {
      currentArcPointCourseFromCenter += 1;
      c = currentArcPointCourseFromCenter > 360
          ? currentArcPointCourseFromCenter - 360
          : currentArcPointCourseFromCenter;

      LatLng point = _haversine.offset(center, radius, bearingFromCourse(c));
      arcPoints.add(point);

      log(name: 'NEW ARC', '>>> пеленг $c');
    } while ((c - arcOutCourseFromCenter).abs() > 1);

    return arcPoints;
  }

  static List<LatLng> _fromPointToCourseCCW({
    required LatLng startPoint,
    required double startCourse,
    required double outCourse,
    required double radius,
    required bool isCw,
  }) {
    List<LatLng> arcPoints = [];
    log(
        name: 'NEW ARC',
        '>>> Create ${isCw ? "CW" : "CCW"} ARC starts from $startPoint WITH course $startCourse; '
        'with radius $radius;'
        'out course $outCourse');

    // находим центр дуги
    double courseToCenter = turnToLeft90(startCourse);
    LatLng center = _haversine.offset(
        startPoint, radius, bearingFromCourse(courseToCenter));

    arcPoints.addAll([startPoint, center]);
    return arcPoints;

    // CW
    /// пеленг на стартовую точку
    double arcStartCourseFromCenter = turnToLeft90(startCourse);

    /// пеленг на конечную точку
    double arcOutCourseFromCenter = turnToLeft90(outCourse);

    log(
        name: 'NEW ARC',
        '>>> курс на стартовую точку $arcStartCourseFromCenter');
    log(name: 'NEW ARC', '>>> курс на конечную точку $arcOutCourseFromCenter');

    // CW
    // наращиваем  курс до совпадения с конечным
    // собираем точки дуги:
    double currentArcPointCourseFromCenter = arcStartCourseFromCenter;
    double c = 0;
    do {
      currentArcPointCourseFromCenter += 1;
      c = currentArcPointCourseFromCenter > 360
          ? currentArcPointCourseFromCenter - 360
          : currentArcPointCourseFromCenter;

      LatLng point = _haversine.offset(center, radius, bearingFromCourse(c));
      arcPoints.add(point);

      log(name: 'NEW ARC', '>>> пеленг $c');
    } while ((c - arcOutCourseFromCenter).abs() > 1);

    return arcPoints;
  }

  static List<LatLng> fromPointToCourse({
    required LatLng startPoint,
    required double startCourse,
    required double outCourse,
    required double radius,
    required bool isCw,
  }) {
    List<LatLng> res = [];
// ClockWise
    if (isCw) {
      res = _fromPointToCourseCW(
        startPoint: startPoint,
        startCourse: startCourse,
        outCourse: outCourse,
        radius: radius,
      );
    } else
// Counter-ClockWise
    if (!isCw) {
      res = _fromPointToCourseCCW(
          startPoint: startPoint,
          startCourse: startCourse,
          outCourse: outCourse,
          radius: radius,
          isCw: isCw);
    }


    return res;
  }
}
