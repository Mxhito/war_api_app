import 'package:war_api_app/app/repository/data_repository.dart';

import '../services/api.dart';
import '../services/model/endpoint_data.dart';

abstract class DataRepositoryInterface {
  factory DataRepositoryInterface() => DataRepository();
  Future<EndpointData> getEndpointData(Endpoint endpoint);
}
