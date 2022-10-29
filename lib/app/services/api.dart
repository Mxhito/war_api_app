enum Endpoint {
  statistics,
  date,
  latest,
}

class API {
  static const String host = 'russianwarship.rip';

  static Uri endpointUri(Endpoint endpoint) => Uri(
        scheme: 'https',
        host: host,
        path: _path[endpoint],
      );

  static final Map<Endpoint, String> _path = {
    Endpoint.statistics: 'api/v1/statistics',
    Endpoint.date: 'api/v1/statistics/',
    Endpoint.latest: 'api/v1/statistics/latest'
  };
}
