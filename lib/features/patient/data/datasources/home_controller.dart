import 'dart:async';

import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:xpert_autism/features/patient/data/datasources/camera_controller.dart';

class HomeController extends GetxController {
  CameraManager? _cameraManager;
  CameraController? cameraController;
  HomeController() {
    _cameraManager = CameraManager();
  }



  Future<void> loadCamera() async {
    cameraController = await _cameraManager?.load();
    update();
  }
}
