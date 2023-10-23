import 'package:sidmap/data/sid_point_data.dart';

class SidLineData{
  SidPointData startPoint;
  List<SidPointData> sidPoints;

  SidLineData(this.startPoint, this.sidPoints);

  Map<String, dynamic> toMap() {
    return {
      'startPoint': startPoint,
      'sidPoints': sidPoints,
    };
  }
}