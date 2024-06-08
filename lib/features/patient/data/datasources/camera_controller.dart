import 'package:camera/camera.dart';

class CameraManager {
  late List<CameraDescription>? cameras;
  CameraController? _controller;

  Future<CameraController?> load() async {
    cameras = await availableCameras();
    //Set front camera if available or back if not available
    // camera avant temchi. ila mkanch temchi arrier
    // int position = cameras!.length > 0 ? 1 : 0;
    int position = 0;
    _controller = CameraController(
      cameras![position],
      ResolutionPreset.medium,
      enableAudio: false,
    );
    await _controller?.initialize();
    return _controller;
  }

  CameraController? get controller => _controller;
}
