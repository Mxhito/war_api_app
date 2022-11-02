import '../services/api.dart';

abstract class APIInterface {
  factory APIInterface() => API();

  Uri endpointUri({required Endpoint endpoint});
}
