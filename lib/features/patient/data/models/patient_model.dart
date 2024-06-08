import 'package:xpert_autism/features/patient/data/models/results_model.dart';
import 'package:xpert_autism/features/patient/domain/entities/patient_entity.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class PatientModel extends Patient {
  List<ResultsModel>? results; // Now a list of ResultsModel

  PatientModel({
    super.uid, // Now nullable
    required super.firstName,
    required super.lastName,
    required super.gender,
    required super.dateOfBirth,
    required super.autismDegree,
    this.results = const [], // Initialize with an empty list
  });

  // Factory method to create a PatientModel from a Firestore document
  factory PatientModel.fromFirestore(DocumentSnapshot doc) {
    Map docData = doc.data() as Map;
    List<ResultsModel> results = [];
    if (docData['results'] != null) {
      // Ensure results is treated as a list
      var resultsList = docData['results'] as List;
      for (var result in resultsList) {
        results.add(ResultsModel.fromMap(result as Map<String, dynamic>));
      }
    }
    return PatientModel(
      uid: doc.id,
      firstName: docData['firstName'] ?? '',
      lastName: docData['lastName'] ?? '',
      gender: docData['gender'] ?? '',
      dateOfBirth: DateTime.fromMillisecondsSinceEpoch(docData['dateOfBirth'].seconds * 1000),
      autismDegree: docData['autismDegree'],
      results: results,
    );
  }

  // Method to convert a PatientModel instance to a map, for Firestore
  Map<String, dynamic> toFirestore() {
    return {
      if (uid != null) 'uid': uid, // Include UID if it is not null
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'dateOfBirth': Timestamp.fromDate(dateOfBirth),
      'autismDegree': autismDegree,
    };
  }
}
