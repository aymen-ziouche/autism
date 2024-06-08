import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:xpert_autism/features/patient/data/datasources/remote_emotions_db.dart';
import 'package:xpert_autism/features/patient/data/datasources/remote_patient_db.dart';
import 'package:xpert_autism/features/patient/data/models/patient_model.dart';
import 'package:xpert_autism/features/patient/data/models/results_model.dart';
import 'package:xpert_autism/features/patient/domain/repositories/base_patient_repo.dart';

@LazySingleton(as: BasePatientRepo)
class Patientrepo implements BasePatientRepo {
  final BasePatientRemoteDB _patientRemoteDB;
  final EmotionDetector emotionDetector;

  Patientrepo(this._patientRemoteDB, this.emotionDetector);

  // Counters for each emotion
  int _disgustCount = 0;
  int _fearCount = 0;
  int _happyCount = 0;
  int _neutralCount = 0;
  int _sadCount = 0;
  int _surpriseCount = 0;
  int _angryCount = 0;

  // Stream subscription for emotions
  StreamSubscription<String>? _emotionSubscription;

  @override
  Future<void> addPatient({required PatientModel patient}) async {
    return await _patientRemoteDB.addPatient(patient: patient);
  }

  @override
  Future<void> saveResults({required String patientId, required ResultsModel results}) async {
    return await _patientRemoteDB.saveResults(patientId: patientId, results: results);
  }

  @override
  Future<List<PatientModel>> getAllPatients() async {
    return await _patientRemoteDB.getAllPatients();
  }

  // Function to listen to the emotion stream and update counters
  @override
  Future<String> listenForEmotions({required String wantedEmotion}) async {
    resetEmotionCounts(); // Reset all emotion counters

    final Completer<String> completer = Completer<String>();
    final stopwatch = Stopwatch()..start(); // Start a stopwatch for timing

    _emotionSubscription = emotionDetector.sendImageForDetection().listen((emotion) {
      updateEmotionCounts(emotion, wantedEmotion);
      if (wantedEmotion == "neutral") {
        if (_disgustCount >= 5 ||
            _fearCount >= 5 ||
            _happyCount >= 5 ||
            _sadCount >= 5 ||
            _surpriseCount >= 5 ||
            _angryCount >= 5) {
          handleSuccessfulDetection(completer, emotion);
        }
      } else {
        if (emotion == wantedEmotion && _getEmotionCount(emotion) >= 5) {
          handleSuccessfulDetection(completer, emotion);
        } else if (stopwatch.elapsedMilliseconds >= 20000) {
          int hundreds = (stopwatch.elapsedMilliseconds / 10).truncate();
          int seconds = (hundreds / 100).truncate();
          int minutes = (seconds / 60).truncate();
          // Handle timeout if desired emotion isn't detected within 2 minutes
          if (minutes >= 1) {
            handleDetectionTimeout();
          }
        }
      }
    }, onError: (error) {
      handleDetectionError(completer, error);
    });
    completer.future.then((_) => closeStreamSubscription());

    return completer.future.timeout(const Duration(minutes: 1), onTimeout: () => handleDetectionTimeout());
  }

  void resetEmotionCounts() {
    _disgustCount = _fearCount = _happyCount = _neutralCount = _sadCount = _surpriseCount = _angryCount = 0;
  }

  void closeStreamSubscription() {
    _emotionSubscription?.cancel();
    _emotionSubscription = null;
    emotionDetector.stopDetection();
  }

  void updateEmotionCounts(String emotion, String wantedEmotion) {
    if (emotion == wantedEmotion) {
      switch (emotion) {
        case "disgust":
          _disgustCount++;
          break;
        case "fear":
          _fearCount++;
          break;
        case "happy":
          _happyCount++;
          break;
        case "neutral":
          _neutralCount++;
          break;
        case "sad":
          _sadCount++;
          break;
        case "surprise":
          _surpriseCount++;
          break;
        case "angry":
          _angryCount++;
          break;
      }
    } else {
      switch (emotion) {
        case "disgust":
          _disgustCount++;
          break;
        case "fear":
          _fearCount++;
          break;
        case "happy":
          _happyCount++;
          break;
        case "neutral":
          _neutralCount++;
          break;
        case "sad":
          _sadCount++;
          break;
        case "surprise":
          _surpriseCount++;
          break;
        case "angry":
          _angryCount++;
          break;
      }
      switch (wantedEmotion) {
        case "disgust":
          _disgustCount = 0;
          break;
        case "fear":
          _fearCount = 0;
          break;
        case "happy":
          _happyCount = 0;
          break;
        case "neutral":
          print("a face is detected");
          break;
        case "sad":
          _sadCount = 0;
          break;
        case "surprise":
          _surpriseCount = 0;
          break;
        case "angry":
          _angryCount = 0;
          break;
      }
    }
  }

  void handleSuccessfulDetection(Completer<String> completer, String emotion) {
    closeStreamSubscription();
    if (!completer.isCompleted) {
      completer.complete(emotion);
    }
  }

  int _getEmotionCount(String emotion) {
    switch (emotion) {
      case "disgust":
        return _disgustCount;
      case "fear":
        return _fearCount;
      case "happy":
        return _happyCount;
      case "neutral":
        return _neutralCount;
      case "sad":
        return _sadCount;
      case "surprise":
        return _surpriseCount;
      case "angry":
        return _angryCount;
      default:
        return 0;
    }
  }

  void handleDetectionError(Completer<String> completer, dynamic error) {
    closeStreamSubscription();
    if (!completer.isCompleted) {
      completer.completeError(error);
    }
  }

  String handleDetectionTimeout() {
    closeStreamSubscription();
    return _getHighestEmotion();
  }

  // Function to identify the emotion with the highest count
  String _getHighestEmotion() {
    int highestCount = 0;
    String highestEmotion = "";

    if (_disgustCount > highestCount) {
      highestCount = _disgustCount;
      highestEmotion = "disgust";
    } else if (_fearCount > highestCount) {
      highestCount = _fearCount;
      highestEmotion = "fear";
    } else if (_happyCount > highestCount) {
      highestCount = _happyCount;
      highestEmotion = "happy";
    } else if (_neutralCount > highestCount) {
      highestCount = _neutralCount;
      highestEmotion = "neutral";
    } else if (_sadCount > highestCount) {
      highestCount = _sadCount;
      highestEmotion = "sad";
    } else if (_surpriseCount > highestCount) {
      highestCount = _surpriseCount;
      highestEmotion = "surprise";
    } else if (_angryCount > highestCount) {
      highestCount = _angryCount;
      highestEmotion = "angry";
    } else {
      highestEmotion = "No Face Detected";
    }
    return highestEmotion;
  }
}
