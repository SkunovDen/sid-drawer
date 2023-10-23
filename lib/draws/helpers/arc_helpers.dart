double bearingFromCourse(double course) {
  return course > 180 ? course - 360 : course;
}

double turnToLeft90(double currentCourse) {
  double t = currentCourse - 90.0;
  return t < 0 ? 360 + t : t;
}

double turnToRight90(double currentCourse) {
  double t = currentCourse + 90.0;
  return t > 360 ? t - 360 : t;
}
