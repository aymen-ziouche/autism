import 'dart:async';
import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:xpert_autism/locator.dart';

class EmotionDetector {
  bool isDetecting = false;
  Map<String, int> emotionCounts = {};
  String currentEmotion = '';
  Timer? emotionTimer;
  Dio dio = Dio();
  Timer? timer;

  Stream<String> sendImageForDetection() async* {
    final cameraController = locator.get<CameraController>();
    const duration = Duration(milliseconds: 2000); // 2 seconds between API calls

    final StreamController<String> controller = StreamController<String>();

    void captureAndProcessImage() async {
      try {
        final image = await cameraController.takePicture();
        final imageBytes = await image.readAsBytes();
        String base64Image = base64Encode(imageBytes);

        var url = 'https://greatdev.pythonanywhere.com/detect';
        var response = await dio.post(url,
            data: jsonEncode({'image': base64Image}), options: Options(contentType: Headers.jsonContentType));

        if (response.statusCode == 200) {
          var responseData = response.data;
          String emotion = responseData['analysis'][0]['dominant_emotion'];
          print("EMOTION : $emotion");

          // Add the emotion to the stream
          controller.add(emotion);
        } else {
          throw Exception('Failed to detect emotion');
        }
      } catch (e) {
        // controller.add("error");
        print('Error sending image for detection: $e');
      }
    }

    // Start the timer for image capture and processing
    timer = Timer.periodic(duration, (_) => captureAndProcessImage());

    // Yield the stream of emotions
    yield* controller.stream;

    // Cleanup: Dispose camera controller and close stream controller when done
    await cameraController.dispose();
    timer?.cancel();
    stopDetection();
    controller.close();
  }

  void stopDetection() {
    emotionTimer?.cancel();
    timer?.cancel();
    emotionTimer = null;
    timer = null;
  }
}
