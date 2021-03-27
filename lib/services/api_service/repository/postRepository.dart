import 'package:test123/models/sampleUserModel.dart';
import 'package:test123/services/api_service/api_config.dart';

// when we want to get data from api we need to register here
class PostRepository {
  ApiConfig _apiConfig = ApiConfig();
  Future<List<SampleUserModel>> fetchPost(int startIndex, int limit) async {
    return await _apiConfig.fetchPost(startIndex, limit);
  }
}
