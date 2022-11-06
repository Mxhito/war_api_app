import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:war_api_app/app/services/model/endpoint_data.dart';
import 'package:war_api_app/app/services/api.dart';
import 'package:war_api_app/app/services/model/terms_data.dart';

abstract class APIServiceInterface {
  factory APIServiceInterface() => APIService();
  
  Future<EndpointData> getEndpointData({required Endpoint endpoint});
  Future<TermsData> getAllTerms({required Endpoint endpoint});
}

class APIService implements APIServiceInterface {
  final api = APIInterface();

  @override
  Future<EndpointData> getEndpointData({required Endpoint endpoint}) async {
    final uri = api.endpointUri(endpoint: endpoint);
  
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final Map<String, dynamic> parsedJson = jsonDecode(response.body);
      final result = EndpointData.fromJson(parsedJson['data']);
      return result;
    }
    throw Exception();
  }

  @override
  Future<TermsData> getAllTerms({required Endpoint endpoint}) async {
    final uri = api.endpointUri(endpoint: endpoint);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final Map<String, dynamic> parsedJson = jsonDecode(response.body);
      final result = TermsData.fromJson(parsedJson['data']);
      return result;
    }
    throw Exception();
  }
}
