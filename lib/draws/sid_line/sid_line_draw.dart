import 'package:geodesy/geodesy.dart';
import 'package:sidmap/draws/arc/new_arc.dart';

import '../../data/sid_point_data.dart';

class SidLineDrawer {
  List<LatLng> draw(List<SidPointData> pointList) {
    List<LatLng> result = [];

    LatLng currentPoint = const LatLng(0, 0);
    double currentCourse = 0;
    double radius = 4000;

    for (int i = 1; i < pointList.length; i++) {
      if (pointList[i - 1].isFlyOver) {
        final LatLng startPoint = currentPoint;
        final startCourse = currentCourse;
        final LatLng outCoursePoint = pointList[i].point;
        const bool isCw = true;

        final List<LatLng> arc = Arc().fromPointToCourseToPoint(
            startPoint: startPoint,
            startCourse: startCourse,
            outCoursePoint: outCoursePoint,
            radius: radius,
            isCw: isCw);

        result.addAll(arc);
        result.add(outCoursePoint);

        currentPoint = LatLng.fromJson(outCoursePoint.toJson());
        currentCourse = Geodesy()
            .bearingBetweenTwoGeoPoints(arc.last, outCoursePoint)
            .toDouble();
      }
    }

    return result;
  }
}