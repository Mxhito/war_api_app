import 'package:http/http.dart';

import '../services/model/endpoint_data.dart';
import '../services/api.dart';
import '../services/api_service_interface.dart';

import 'data_repository_interface.dart';

class DataRepository implements DataRepositoryInterface {
  final apiServiceInterface = APIServiceInterface();

  @override
  Future<EndpointData> getEndpointData(Endpoint endpoint) async {
    try {
      final data = await apiServiceInterface.getEndpointData(endpoint: endpoint);
      return EndpointData(
        date: data.date,
        day: data.day,
        resource: data.resource,
        stats: data.stats,
        increase: data.increase,
      );
    } on Response {
      rethrow;
    }
  }

  //* В этом классе, по идее, я должен получить EndpointData из APIService
  //* и расспределить её в понятную и простую структуру для исользования
  //* чтобы в UI уровне долучать данные в переменных
}
