import 'dart:async';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:xpert_autism/features/patient/data/datasources/camera_controller.dart';
import 'package:xpert_autism/features/patient/data/datasources/face_detector_controller.dart';
import 'package:xpert_autism/features/patient/data/models/face_model.dart';

class HomeController extends GetxController {
  CameraManager? _cameraManager;
  CameraController? cameraController;
  FaceDetetorController? _faceDetect;
  bool _isDetecting = false;
  List<FaceModel>? faces;
  String? label = 'Normal';
  DateTime? faceDetectedTime;
  bool smile = false;
  Timer? _processTimer;
  final _processingInterval = const Duration(milliseconds: 100); // Adjust for desired frame rate

  HomeController() {
    _cameraManager = CameraManager();
    _faceDetect = FaceDetetorController();
  }
  Future<bool> isSmiling() async {
    switch (label?.toLowerCase().split(".").last) {
      case 'veryhappy':
      case 'happy':
        return true;
      default:
        return false;
    }
  }

  bool isSad() {
    if (faceDetectedTime != null && label?.toLowerCase().split(".").last == 'sad') {
      return true;
    } else {
      return false;
    }
  }

  Future<void> loadCamera() async {
    cameraController = await _cameraManager?.load();
    update();
  }

  Future<void> startImageStream() async {
    cameraController?.startImageStream((cameraImage) async {
      if (_isDetecting) return;

      _isDetecting = true;

      final WriteBuffer allBytes = WriteBuffer();
      for (Plane plane in cameraImage.planes) {
        allBytes.putUint8List(plane.bytes);
      }
      final bytes = allBytes.done().buffer.asUint8List();

      final Size imageSize = Size(cameraImage.width.toDouble(), cameraImage.height.toDouble());

      const InputImageRotation imageRotation = InputImageRotation.rotation0deg;

      const InputImageFormat inputImageFormat = InputImageFormat.nv21;

      final planeData = cameraImage.planes.map(
        (Plane plane) {
          return plane;
        },
      ).toList();

      final inputImageData = InputImageMetadata(
        size: imageSize,
        rotation: imageRotation,
        format: inputImageFormat,
        bytesPerRow: planeData[0].bytesPerRow,
      );

      final inputImage = InputImage.fromBytes(
        bytes: bytes,
        metadata: inputImageData,
      );

      // processImage(inputImage);
      _processTimer?.cancel();
      _processTimer = Timer(_processingInterval, () => processImage(inputImage));
    });
  }

  Future<void> processImage(inputImage) async {
    faces = await _faceDetect?.processImage(inputImage);

    if (faces != null && faces!.isNotEmpty) {
      FaceModel? face = faces?.first;
      var emotion = detectSmile(face!, face.smile);
      label = emotion.emotion.toString();
      faceDetectedTime ??= DateTime.now();
      smile = true;
      isSmiling();
    } else {
      label = 'No face detected';
      faceDetectedTime = null;
      smile = false;
    }
    _isDetecting = false;
    update();
  }

  FaceModel detectSmile(FaceModel face, smileProb) {
    print("SMILE ===> $smileProb");
    if (smileProb > 0.86) {
      face.emotion = Emotion.veryHappy;
      return face;
    } else if (smileProb > 0.8) {
      face.emotion = Emotion.happy;
      return face;
    } else if (smileProb > 0.3) {
      face.emotion = Emotion.happy;
      return face;
    } else {
      face.emotion = Emotion.sad;
      return face;
    }
  }
}
