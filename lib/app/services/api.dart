enum Endpoint {
  latest,
  termsEn,
  termsUa,
}

abstract class APIInterface {
  factory APIInterface() => API();

  Uri endpointUri({required Endpoint endpoint});
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
