import 'package:sidmap/data/sid_point_data.dart';

class SidLineData {
  SidPointData startPoint;
  double startCourse;
  List<SidPointData> sidPoints;

  SidLineData(this.startPoint, this.startCourse, this.sidPoints);

  Map<String, dynamic> toMap() {
    return {
      'startPoint': startPoint,
      'startCourse': startCourse,
      'sidPoints': sidPoints,
    };
  }
}
