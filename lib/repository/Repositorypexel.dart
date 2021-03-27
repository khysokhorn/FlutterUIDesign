import 'package:test123/models/pexelsModel/pexelsImageModel.dart';
import 'package:test123/services/api_service/ServicePexel.dart';

class PexelRepository {
  Future<PexelModel> fetchImages() {
    return ServicePexel().fetchImagesPexel();
  }
}
