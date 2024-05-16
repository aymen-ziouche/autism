import 'package:xpert_autism/features/patient/data/models/face_model.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class FaceDetetorController {
  FaceDetector? _faceDetector;

  Future<List<FaceModel>?> processImage(inputImage) async {
    _faceDetector = GoogleMlKit.vision.faceDetector(
      FaceDetectorOptions(
        enableClassification: true,
        enableLandmarks: true,
      ),
    );

    final faces = await _faceDetector?.processImage(inputImage);
    return extractFaceInfo(faces);
  }

  List<FaceModel>? extractFaceInfo(List<Face>? faces) {
    List<FaceModel>? response = [];
    double? smile;
    double? leftEyeOpenProbability;
    double? rightEyeOpenProbability;
    double? eulerY;
    double? eulerZ;

    for (Face face in faces!) {
      if (face.smilingProbability != null) {
        smile = face.smilingProbability;
      }

      rightEyeOpenProbability = face.rightEyeOpenProbability;
      leftEyeOpenProbability = face.leftEyeOpenProbability;
      eulerY = face.headEulerAngleY;
      eulerZ = face.headEulerAngleZ;

      final faceModel = FaceModel(
        smile: smile,
        eulerY: eulerY,
        eulerZ: eulerZ,
        leftEyeOpenProbability: leftEyeOpenProbability,
        rightEyeOpenProbability: rightEyeOpenProbability,
      );

      response.add(faceModel);
    }

    return response;
  }
}
