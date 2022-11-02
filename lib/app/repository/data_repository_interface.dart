import 'package:war_api_app/app/repository/data_repository.dart';

import '../services/api.dart';

abstract class DataRepositoryInterface {
  factory DataRepositoryInterface() => DataRepository();

  Future<List<List<int>>> getEndpointData({required Endpoint endpoint});
  Future<List<Map<String, String>>> getAllTerms({required Endpoint endpoint});
}
