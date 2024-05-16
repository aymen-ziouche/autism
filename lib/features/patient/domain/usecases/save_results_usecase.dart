import 'package:injectable/injectable.dart';
import 'package:xpert_autism/features/patient/data/models/results_model.dart';
import 'package:xpert_autism/features/patient/domain/repositories/base_patient_repo.dart';

@Injectable()
class SaveResultsUseCase {
  final BasePatientRepo _basePatientRepo;

  SaveResultsUseCase(this._basePatientRepo);

  Future<void> call({required String patientId, required ResultsModel results}) async {
    return await _basePatientRepo.saveResults(patientId: patientId, results: results);
  }
}
