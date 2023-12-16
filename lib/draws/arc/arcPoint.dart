import 'package:latlong2/latlong.dart';

class ArcPoint{
  final LatLng coordinates;
  final double trueCourse;

  ArcPoint({ required this.coordinates, required this.trueCourse } );

  @override
  String toString() {
    return 'ArcPoint{coordinates: $coordinates, trueCourse: $trueCourse}';
  }
}