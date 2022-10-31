import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:war_api_app/app/services/api_interface.dart';
import 'package:war_api_app/app/services/model/endpoint_data.dart';
import 'package:war_api_app/app/services/api.dart';

import 'api_service_interface.dart';

class APIService implements APIServiceInterface {
  final api = APIInterface();

  @override
  Future<EndpointData> getEndpointData({required Endpoint endpoint}) async {
    final uri = api.endpointUri(endpoint);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final Map<String, dynamic> parsedJson = jsonDecode(response.body);
      final result = EndpointData.fromJson(parsedJson['data']);
      return result;
    }
    throw Exception();
  }

  @override
  Future<Map<String, String>> getAllTerms(
      QueryParameters? queryParameters) async {
    final uri = api.endpointUri(Endpoint.terms);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final Map<String, dynamic> parsedJson = jsonDecode(response.body);
      print(parsedJson);
      return {};
    }
    throw Exception();
  }
}
