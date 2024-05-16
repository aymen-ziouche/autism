import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xpert_autism/features/patient/data/models/patient_model.dart';
import 'package:xpert_autism/features/patient/data/models/results_model.dart';
import 'package:xpert_autism/features/patient/domain/usecases/add_patient_usecase.dart';
import 'package:xpert_autism/features/patient/domain/usecases/detect_emotion_usecase.dart';
import 'package:xpert_autism/features/patient/domain/usecases/get_patients_usecase.dart';
import 'package:xpert_autism/features/patient/domain/usecases/save_results_usecase.dart';

part 'patient_cubit.freezed.dart';
part 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  final AddPatientUseCase addPatientUseCase;
  final SaveResultsUseCase saveResultsUseCase;
  final GetPatientsUseCase getPatientsUseCase;
  final DetectEmotionUsecase _detectEmotionUsecase;

  PatientCubit(
    this.addPatientUseCase,
    this.getPatientsUseCase,
    this._detectEmotionUsecase,
    this.saveResultsUseCase,
  ) : super(const PatientState.initial());
  List<PatientModel>? patients;
  Future<void> addPatient({required PatientModel patient}) async {
    try {
      emit(const PatientState.addPatientloading());
      await addPatientUseCase.call(patient: patient);
      emit(const PatientState.addpatientloaded());
    } catch (e) {
      emit(PatientState.error(e.toString()));
    }
  }

  Future<void> saveResults({required String patientId, required ResultsModel results}) async {
    try {
      await saveResultsUseCase.call(patientId: patientId, results: results);
    } catch (e) {
      emit(PatientState.error(e.toString()));
    }
  }

  Future<void> getPatients() async {
    emit(const PatientState.addPatientloading());
    patients = await getPatientsUseCase.call();
    emit(const PatientState.patientloaded());
  }

  Future<void> listenForEmotions({required String wantedEmotion}) async {
    try {
      String detectedEmotion = await _detectEmotionUsecase.call(wantedEmotion: wantedEmotion);
      emit(PatientState.emotionDetected(detectedEmotion));
    } catch (e) {
      emit(PatientState.error(e.toString()));
    }
  }
}
