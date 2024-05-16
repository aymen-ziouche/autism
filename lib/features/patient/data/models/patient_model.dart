import 'package:xpert_autism/features/patient/data/models/results_model.dart';
import 'package:xpert_autism/features/patient/domain/entities/patient_entity.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class PatientModel extends Patient {
  
  ResultsModel? results;
  PatientModel({
    super.uid, // Now nullable
    required super.firstName,
    required super.lastName,
    required super.gender,
    required super.dateOfBirth,
    required super.autismDegree,
    this.results,
  });

  // Factory method to create a PatientModel from a Firestore document
  factory PatientModel.fromFirestore(DocumentSnapshot doc) {
    Map docData = doc.data() as Map;
        ResultsModel? results = docData['results'] != null 
      ? ResultsModel.fromMap(docData['results'] as Map<String, dynamic>)
      : null;

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
