import 'package:war_api_app/app/services/api_interface.dart';

enum Endpoint {
  //statistics,
  //date,
  latest,
  terms,
}

enum QueryParameters {
  ua,
  eu,
}

class API implements APIInterface {
  static const String host = 'russianwarship.rip';

  @override
  Uri endpointUri(Endpoint endpoint, [QueryParameters? queryParameters]) => Uri(
      scheme: 'https',
      host: host,
      path: _path[endpoint],
      query: _queryParameters[queryParameters]);

  static final Map<Endpoint, String> _path = {
    //Endpoint.statistics: 'api/v1/statistics',
    //Endpoint.date: 'api/v1/statistics/',
    Endpoint.latest: 'api/v1/statistics/latest',
    Endpoint.terms: 'api/v1/terms/',
  };

  static final Map<QueryParameters, String> _queryParameters = {
    QueryParameters.ua: 'UA',
    QueryParameters.eu: 'EU',
  };
}
