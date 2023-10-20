import 'package:latlong2/latlong.dart';
import './transition_data.dart';

class SidData{
  late LatLng startPoint;
  late final List<TransitionData> transitions;

  SidData(this.startPoint, this.transitions);
}