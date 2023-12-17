import 'dart:developer';

import 'package:latlong2/latlong.dart';
import 'package:sidmap/draws/helpers/arc_helpers.dart';

class Arc{
  static const _haversine = Haversine();

  static List<LatLng> fromPointToCourse({

    required LatLng startPoint,
    required double startCourse,
    required double outCourse,
    required double radius,
    required bool isCw,
}){
    List<LatLng> arcPoints = [];
    log(name: 'NEW ARC', '>>> Create ${isCw ? "CW" : "CCW"} ARC starts from $startPoint WITH course $startCourse; '
        'with radius $radius;'
        'out course $outCourse');

    // находим центр дуги
    double courseToCenter = isCw
    ? turnToRight90(startCourse)
    : turnToLeft90(startCourse);
    LatLng center = _haversine.offset(startPoint, radius, bearingFromCourse(courseToCenter));

    // arcPoints.addAll([startPoint, center]);

    // CW
     /// пеленг на стартовую точку
    double arcStartBearing = bearingFromCourse(turnToLeft90(startCourse));
    /// пеленг на конечную точку
    double arcOutBearing = bearingFromCourse(turnToLeft90(outCourse));

    log(name: 'NEW ARC', '>>> пеленг на стартовую точку $arcStartBearing');
    log(name: 'NEW ARC', '>>> пеленг на конечную точку $arcOutBearing');

    // наращивае  пеленг до совпадения с конечным
    // собираем точки дуги:
    double currentArcPointBearing = arcStartBearing;

    do { currentArcPointBearing += 1;

    LatLng point = _haversine.offset(center,radius, currentArcPointBearing);
    arcPoints.add(point);
      log(name: 'NEW ARC', '>>> пеленг $currentArcPointBearing');
    } while((currentArcPointBearing - arcOutBearing).abs() > 1);




    return arcPoints;
  }
}