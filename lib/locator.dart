import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:xpert_autism/features/patient/data/datasources/remote_emotions_db.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  locator.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  locator.registerSingleton<FirebaseStorage>(FirebaseStorage.instance);
  locator.registerSingleton<EmotionDetector>(EmotionDetector());
  final cameras = await availableCameras();
  final cameraController = CameraController(cameras[0], ResolutionPreset.medium);
  await cameraController.initialize(); // Initialize the camera controller
  locator.registerSingleton<CameraController>(cameraController);
}
