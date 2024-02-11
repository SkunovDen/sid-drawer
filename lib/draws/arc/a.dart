import 'package:geodesy/geodesy.dart';

class ArcNew{
  late final LatLng startPoint;
  late final LatLng endPoint;
  late final double radius;

  ArcNew from(LatLng startPoint){
    this.startPoint = startPoint;
    return this;
  }
  ArcNew to(LatLng endPoint){
    this.endPoint = endPoint;
    return this;
  }

  ArcNew withRadius(double radius){
    this.radius = radius;
    return this;
  }

  List<LatLng> clockWise(){
    return <LatLng>[];
  }
}