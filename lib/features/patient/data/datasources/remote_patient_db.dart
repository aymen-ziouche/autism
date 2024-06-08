import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:xpert_autism/features/patient/data/models/patient_model.dart';
import 'package:xpert_autism/features/patient/data/models/results_model.dart';

abstract class BasePatientRemoteDB {
  Future<void> addPatient({required PatientModel patient});
  Future<void> saveResults({required String patientId, required ResultsModel results});
  Future<List<PatientModel>> getAllPatients();
}

@LazySingleton(as: BasePatientRemoteDB)
class PatientRemoteDB implements BasePatientRemoteDB {
  final FirebaseFirestore _firestore;

  PatientRemoteDB(this._firestore);

  @override
  Future<void> addPatient({required PatientModel patient}) async {
    try {
      var ref = _firestore.collection('patients').doc(patient.uid);

      // Create a new document with a new UID if uid is null
      if (patient.uid == null) {
        ref = _firestore.collection('patients').doc();
        patient.uid = ref.id; // Assign the generated UID back to the patient
      }

      return await ref.set(patient.toFirestore());
    } catch (e) {
      throw Exception("failed to save Patient");
    }
  }

  @override
  Future<void> saveResults({required String patientId, required ResultsModel results}) async {
    try {
      // Reference to the specific patient document by patientId
      var patientRef = _firestore.collection('patients').doc(patientId);

      // Retrieve the current patient document
      var patientDoc = await patientRef.get();

      // Get the current results list or initialize an empty list if it doesn't exist
      List<dynamic> currentResults = patientDoc.data()?['results'] ?? [];

      // Append the new result to the current results list
      currentResults.add(results.toMap());

      // Update the patient document with the new results list
      await patientRef.update({
        'results': currentResults,
      });
    } catch (e) {
      throw Exception("Failed to save results: ${e.toString()}");
    }
  }

  // Method to fetch all patients
  @override
  Future<List<PatientModel>> getAllPatients() async {
    var snapshot = await _firestore.collection('patients').get();
    return snapshot.docs.map((doc) => PatientModel.fromFirestore(doc)).toList();
  }
}
