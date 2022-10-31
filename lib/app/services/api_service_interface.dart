import 'api.dart';
import 'api_service.dart';

import 'model/endpoint_data.dart';

abstract class APIServiceInterface {
  factory APIServiceInterface() => APIService();
  Future<EndpointData> getEndpointData({required Endpoint endpoint});
  Future<Map<String, String>> getAllTerms(QueryParameters? queryParameters);
}
