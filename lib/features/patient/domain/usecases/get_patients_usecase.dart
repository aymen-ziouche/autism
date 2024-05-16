import 'package:injectable/injectable.dart';
import 'package:xpert_autism/features/patient/data/models/patient_model.dart';
import 'package:xpert_autism/features/patient/domain/repositories/base_patient_repo.dart';

@Injectable()
class GetPatientsUseCase {
  final BasePatientRepo _basePatientRepo;

  GetPatientsUseCase(this._basePatientRepo);

  Future<List<PatientModel>> call() async {
    return await _basePatientRepo.getAllPatients();
  }
}
