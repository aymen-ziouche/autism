
import 'package:injectable/injectable.dart';
import 'package:xpert_autism/features/patient/domain/repositories/base_patient_repo.dart';

@Injectable()
class DetectEmotionUsecase {
  final BasePatientRepo _basePatientRepo;

  DetectEmotionUsecase(this._basePatientRepo);

  Future<String> call({required String wantedEmotion}) async {
    return await _basePatientRepo.listenForEmotions(wantedEmotion: wantedEmotion);
  }
}
