import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:war_api_app/app/model/data_model.dart';
import 'package:war_api_app/app/services/api.dart';

class APIService {
  static Future<Data> getEndpointData({required Endpoint endpoint}) async {
    final uri = API.endpointUri(endpoint);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final Map<String, dynamic> parsedJson = jsonDecode(response.body);
      final result = Data.fromJson(parsedJson['data']);
      return result;
    }
    throw Exception();
  }
}
