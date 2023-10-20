double caLengthMeters(double minAltFt){
  // l = h (ft) / 0.07(7%) / 0.31 (m/ft)
  return minAltFt *  4.3;
}