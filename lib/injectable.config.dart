// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:xpert_autism/features/patient/data/datasources/remote_emotions_db.dart'
    as _i7;
import 'package:xpert_autism/features/patient/data/datasources/remote_patient_db.dart'
    as _i3;
import 'package:xpert_autism/features/patient/data/repositories/patient_repo.dart'
    as _i6;
import 'package:xpert_autism/features/patient/domain/repositories/base_patient_repo.dart'
    as _i5;
import 'package:xpert_autism/features/patient/domain/usecases/add_patient_usecase.dart'
    as _i8;
import 'package:xpert_autism/features/patient/domain/usecases/detect_emotion_usecase.dart'
    as _i10;
import 'package:xpert_autism/features/patient/domain/usecases/get_patients_usecase.dart'
    as _i9;
import 'package:xpert_autism/features/patient/domain/usecases/save_results_usecase.dart'
    as _i11;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.BasePatientRemoteDB>(
        () => _i3.PatientRemoteDB(gh<_i4.FirebaseFirestore>()));
    gh.lazySingleton<_i5.BasePatientRepo>(() => _i6.Patientrepo(
          gh<_i3.BasePatientRemoteDB>(),
          gh<_i7.EmotionDetector>(),
        ));
    gh.factory<_i8.AddPatientUseCase>(
        () => _i8.AddPatientUseCase(gh<_i5.BasePatientRepo>()));
    gh.factory<_i9.GetPatientsUseCase>(
        () => _i9.GetPatientsUseCase(gh<_i5.BasePatientRepo>()));
    gh.factory<_i10.DetectEmotionUsecase>(
        () => _i10.DetectEmotionUsecase(gh<_i5.BasePatientRepo>()));
    gh.factory<_i11.SaveResultsUseCase>(
        () => _i11.SaveResultsUseCase(gh<_i5.BasePatientRepo>()));
    return this;
  }
}
