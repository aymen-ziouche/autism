
class FaceModel {
  double? smile;
  Emotion? emotion;
  double? rightEyeOpenProbability;
  double? leftEyeOpenProbability;
  double? eulerY; // Yaw - left and right rotation
  double? eulerZ; // Roll - tilting head sideways

  FaceModel({
    this.smile,
    this.emotion,
    this.rightEyeOpenProbability,
    this.leftEyeOpenProbability,
    this.eulerY,
    this.eulerZ,
  });

  bool isLookingAtCamera({double threshold = 10.0}) {
    // Assume the face is looking at the camera if the absolute yaw and roll values are below a certain threshold
    return (eulerY?.abs() ?? threshold) < threshold && (eulerZ?.abs() ?? threshold) < threshold;
  }
}


enum Emotion{
  veryHappy,
  happy,
  netural,
  sad
}