import 'package:http/http.dart';

import '../services/api.dart';
import '../services/api_service.dart';

abstract class RepositoryInterface {
  factory RepositoryInterface() => Repository();

  Future<List<int>> getStats();
  Future<List<int>> getStatsIncrease();
  Future<List<String>> getNames({required Endpoint endpoint});
  Future<List<String>> getIcons();
  Future<DateTime> getLastUpdateDate();
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
      return [
        data.personnelUnits['title'] ?? '',
        data.tanks['title'] ?? '',
        data.armouredFightingVehicles['title'] ?? '',
        data.artillerySystems['title'] ?? '',
        data.mlrs['title'] ?? '',
        data.aaWarfareSystems['title'] ?? '',
        data.planes['title'] ?? '',
        data.helicopters['title'] ?? '',
        data.vehiclesFuelTanks['title'] ?? '',
        data.warshipsCutters['title'] ?? '',
        data.uavSystems['title'] ?? '',
        data.specialMilitaryEquip['title'] ?? '',
        data.atgmSrbmSystems['title'] ?? '',
        data.cruiseMissiles['title'] ?? '',
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
      return [
        data.personnelUnits['icon'] ?? '',
        data.tanks['icon'] ?? '',
        data.armouredFightingVehicles['icon'] ?? '',
        data.artillerySystems['icon'] ?? '',
        data.mlrs['icon'] ?? '',
        data.aaWarfareSystems['icon'] ?? '',
        data.planes['icon'] ?? '',
        data.helicopters['icon'] ?? '',
        data.vehiclesFuelTanks['icon'] ?? '',
        data.warshipsCutters['icon'] ?? '',
        data.uavSystems['icon'] ?? '',
        data.specialMilitaryEquip['icon'] ?? '',
        data.atgmSrbmSystems['icon'] ?? '',
        data.cruiseMissiles['icon'] ?? '',
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

  //* В этом классе, по идее, я должен получить данные из APIService
  //* и расспределить её в понятную и простую структуру для исользования в UI уровне!
}
