import 'package:war_api_app/app/services/api_interface.dart';

enum Endpoint {
  latest,
  termsEn,
  termsUa,
}

class API implements APIInterface {
  static const String host = 'russianwarship.rip';

  @override
  Uri endpointUri({required Endpoint endpoint}) => Uri(
        scheme: 'https',
        host: host,
        path: _path[endpoint],
      );

  static final Map<Endpoint, String> _path = {
    Endpoint.latest: 'api/v1/statistics/latest',
    Endpoint.termsEn: 'api/v1/terms/en',
    Endpoint.termsUa: 'api/v1/terms/ua',
  };
}
