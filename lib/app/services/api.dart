enum Endpoint {
  statistics,
  date,
  latest,
}

class API {
  static const String host = 'russianwarship.rip/api/v1';

  Uri endpointUri(Endpoint endpoint) => Uri(
        scheme: 'https',
        host: host,
        path: _path[endpoint],
      );

  static final Map<Endpoint, String> _path = {
    Endpoint.statistics: 'statistics',
    Endpoint.date: 'statistics/',
    Endpoint.latest: 'statistics/latest'
  };
}
