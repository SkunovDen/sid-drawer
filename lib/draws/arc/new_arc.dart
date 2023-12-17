import 'package:latlong2/latlong.dart';

class Arc {
  final _haversine = const Haversine();

  double _bearingFromCourse(double course) {
    return course > 180 ? course - 360 : course;
  }

  double _turnToLeft90(double currentCourse) {
    double t = currentCourse - 90.0;
    return t < 0 ? 360 + t : t;
  }

  double _turnToRight90(double currentCourse) {
    double t = currentCourse + 90.0;
    return t > 360 ? t - 360 : t;
  }


  List<LatLng> _fromPointToCourseCW({
    required LatLng startPoint,
    required double startCourse,
    required double outCourse,
    required double radius,
  }) {
    List<LatLng> arcPoints = [];

    // находим центр дуги
    double courseToCenter = _turnToRight90(startCourse);
    LatLng center = _haversine.offset(
        startPoint, radius, _bearingFromCourse(courseToCenter));

    // CW
    /// пеленг на стартовую точку
    /// пеленг на конечную точку
    double arcStartCourseFromCenter = _turnToLeft90(startCourse);
    double arcOutCourseFromCenter = _turnToLeft90(outCourse);

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

      LatLng point =
          _haversine.offset(center, radius, _bearingFromCourse(c));
      arcPoints.add(point);
    } while ((c - arcOutCourseFromCenter).abs() > 1);

    return arcPoints;
  }

  List<LatLng> _fromPointToCourseCCW({
    required LatLng startPoint,
    required double startCourse,
    required double outCourse,
    required double radius,
  }) {
    List<LatLng> arcPoints = [];

    // находим центр дуги
    double courseToCenter = _turnToLeft90(startCourse);
    LatLng center = _haversine.offset(
        startPoint, radius, _bearingFromCourse(courseToCenter));

    // CCW
    /// пеленг на стартовую точку
    /// пеленг на конечную точку
    double arcStartCourseFromCenter = _turnToRight90(startCourse);
    double arcOutCourseFromCenter = _turnToRight90(outCourse);

    // CW
    // уменьшаем  курс до совпадения с конечным
    // собираем точки дуги:
    double currentArcPointCourseFromCenter = arcStartCourseFromCenter;
    double c = 0;
    do {
      currentArcPointCourseFromCenter -= 1;
      c = currentArcPointCourseFromCenter < 0
          ? currentArcPointCourseFromCenter + 360
          : currentArcPointCourseFromCenter;

      LatLng point =
          _haversine.offset(center, radius, _bearingFromCourse(c));
      arcPoints.add(point);
    } while ((c - arcOutCourseFromCenter).abs() > 1);

    return arcPoints;
  }

  List<LatLng> fromPointToCourse({
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
      );
    }

    return res;
  }
}
