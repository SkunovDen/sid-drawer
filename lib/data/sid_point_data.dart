import 'package:latlong2/latlong.dart';

class SidPointData{
  final LatLng point;
  final bool isFlyOver;

  SidPointData({ required this.point, required this.isFlyOver });

  @override
  String toString() {
    return 'SidPointData{point: $point, isFlyOver: $isFlyOver}';
  }
}