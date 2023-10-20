class TransitionData {
  late String path;
  late String fixType;
  late String fixId;

  late int mCourse;
  late String minAlt;

  TransitionData(
      this.path, this.fixType, this.fixId, this.mCourse, this.minAlt);

  Map<String, dynamic> toMap() {
    return {
      'path': path,
      'fixType': fixType,
      'fixId': fixId,
      'mCourse': mCourse,
      'minAlt': minAlt,
    };
  }
}
