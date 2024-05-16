import 'package:xpert_autism/features/patient/data/models/patient_model.dart';
import 'package:xpert_autism/features/patient/data/models/results_model.dart';

abstract class BasePatientRepo {
  Future<void> addPatient({required PatientModel patient});
  Future<void> saveResults({required String patientId, required ResultsModel results});
  Future<List<PatientModel>> getAllPatients();
  Future<String> listenForEmotions({required String wantedEmotion});
}
