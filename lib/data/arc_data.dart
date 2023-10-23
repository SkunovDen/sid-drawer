import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ArcData{
  Polyline arc;
  LatLng lastPoint;

  ArcData(this.arc, this.lastPoint);
}