import 'package:http/http.dart';

import '../services/api/api.dart';
import '../services/api/api_service.dart';


abstract class RepositoryInterface {
  factory RepositoryInterface() => Repository();

  Future<List<int>> getStats();
  Future<List<int>> getStatsIncrease();
  Future<List<String>> getNames({required Endpoint endpoint});
  Future<List<String>> getIcons();
  Future<DateTime> getLastUpdateDate();
  Future<int> getDayOfWar();
}

class Repository implements RepositoryInterface {
  final apiServiceInterface = APIServiceInterface();

  @override
  Future<List<int>> getStats() async {
    try {
      final data =
          await apiServiceInterface.getEndpointData(endpoint: Endpoint.latest);
      final stats = data.stats;
      return [
        stats.personnelUnits,
        stats.tanks,
        stats.armouredFightingVehicles,
        stats.artillerySystems,
        stats.mlrs,
        stats.aaWarfareSystems,
        stats.planes,
        stats.helicopters,
        stats.vehiclesFuelTanks,
        stats.warshipsCutters,
        stats.uavSystems,
        stats.specialMilitaryEquip,
        stats.atgmSrbmSystems,
        stats.cruiseMissiles,
      ];
    } on Response {
      rethrow;
    }
  }

  @override
  Future<List<int>> getStatsIncrease() async {
    try {
      final data =
          await apiServiceInterface.getEndpointData(endpoint: Endpoint.latest);
      final increase = data.increase;
      return [
        increase.personnelUnits,
        increase.tanks,
        increase.armouredFightingVehicles,
        increase.artillerySystems,
        increase.mlrs,
        increase.aaWarfareSystems,
        increase.planes,
        increase.helicopters,
        increase.vehiclesFuelTanks,
        increase.warshipsCutters,
        increase.uavSystems,
        increase.specialMilitaryEquip,
        increase.atgmSrbmSystems,
        increase.cruiseMissiles,
      ];
    } on Response {
      rethrow;
    }
  }

  @override
  Future<List<String>> getNames({required Endpoint endpoint}) async {
    try {
      final data = await apiServiceInterface.getAllTerms(endpoint: endpoint);
      const String key = 'title';
      return [
        data.personnelUnits[key] ?? '',
        data.tanks[key] ?? '',
        data.armouredFightingVehicles[key] ?? '',
        data.artillerySystems[key] ?? '',
        data.mlrs[key] ?? '',
        data.aaWarfareSystems[key] ?? '',
        data.planes[key] ?? '',
        data.helicopters[key] ?? '',
        data.vehiclesFuelTanks[key] ?? '',
        data.warshipsCutters[key] ?? '',
        data.uavSystems[key] ?? '',
        data.specialMilitaryEquip[key] ?? '',
        data.atgmSrbmSystems[key] ?? '',
        data.cruiseMissiles[key] ?? '',
      ];
    } on Response {
      rethrow;
    }
  }

  @override
  Future<List<String>> getIcons() async {
    try {
      final data =
          await apiServiceInterface.getAllTerms(endpoint: Endpoint.termsEn);
      const String key = 'icon';
      return [
        data.personnelUnits[key] ?? '',
        data.tanks[key] ?? '',
        data.armouredFightingVehicles[key] ?? '',
        data.artillerySystems[key] ?? '',
        data.mlrs[key] ?? '',
        data.aaWarfareSystems[key] ?? '',
        data.planes[key] ?? '',
        data.helicopters[key] ?? '',
        data.vehiclesFuelTanks[key] ?? '',
        data.warshipsCutters[key] ?? '',
        data.uavSystems[key] ?? '',
        data.specialMilitaryEquip[key] ?? '',
        data.atgmSrbmSystems[key] ?? '',
        data.cruiseMissiles[key] ?? '',
      ];
    } on Response {
      rethrow;
    }
  }

  @override
  Future<DateTime> getLastUpdateDate() async {
    try {
      final data =
          await apiServiceInterface.getEndpointData(endpoint: Endpoint.latest);
      return data.date;
    } on Response {
      rethrow;
    }
  }

  @override
  Future<int> getDayOfWar() async {
    try {
      final data =
          await apiServiceInterface.getEndpointData(endpoint: Endpoint.latest);
      return data.day;
    } on Response {
      rethrow;
    }
  }

  //* В этом классе, по идее, я должен получить данные из APIService
  //* и расспределить её в понятную и простую структуру для исользования в UI уровне!
}
