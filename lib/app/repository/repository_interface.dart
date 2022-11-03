import 'package:war_api_app/app/repository/repository.dart';

import '../services/api.dart';

abstract class RepositoryInterface {
  factory RepositoryInterface() => Repository();

  Future<List<List<int>>> getEndpointData({required Endpoint endpoint});
  Future<List<Map<String, String>>> getAllTerms({required Endpoint endpoint});
  Future<DateTime> getLastUpdateDate();
}
