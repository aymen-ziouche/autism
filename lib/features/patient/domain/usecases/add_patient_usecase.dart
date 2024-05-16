import 'package:injectable/injectable.dart';
import 'package:xpert_autism/features/patient/data/models/patient_model.dart';
import 'package:xpert_autism/features/patient/domain/repositories/base_patient_repo.dart';

@Injectable()
class AddPatientUseCase {
  final BasePatientRepo _basePatientRepo;

  AddPatientUseCase( this._basePatientRepo);

  Future<void> call({required PatientModel patient}) async {
    return await _basePatientRepo.addPatient(patient: patient);
  }
}