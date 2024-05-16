part of 'patient_cubit.dart';

@freezed
class PatientState with _$PatientState {
  const factory PatientState.initial() = _Initial;
  const factory PatientState.addPatientloading() = _AddPatientLoading;
  const factory PatientState.patientloading() = _PatientLoading;
  const factory PatientState.addpatientloaded() = _AddPatientLoaded;
  const factory PatientState.patientloaded() = _PatientLoaded;
  const factory PatientState.emotionDetected(String detectedEmotion) = _EmotionDetected;
  const factory PatientState.error(String errorMessage) = _Error;
}
