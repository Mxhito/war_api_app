import 'package:http/http.dart';

import '../services/api.dart';
import '../services/api_service_interface.dart';

import 'data_repository_interface.dart';

class DataRepository implements DataRepositoryInterface {
  final apiServiceInterface = APIServiceInterface();

  @override
  Future<List<List<int>>> getEndpointData({required Endpoint endpoint}) async {
    try {
      final data =
          await apiServiceInterface.getEndpointData(endpoint: endpoint);
      final stats = data.stats;
      final increase = data.increase;
      return [
        [stats.personnelUnits, increase.personnelUnits],
        [stats.tanks, stats.tanks],
        [stats.armouredFightingVehicles, increase.armouredFightingVehicles],
        [stats.artillerySystems, increase.artillerySystems],
        [stats.mlrs, increase.mlrs],
        [stats.aaWarfareSystems, increase.aaWarfareSystems],
        [stats.planes, increase.planes],
        [stats.helicopters, increase.helicopters],
        [stats.vehiclesFuelTanks, increase.vehiclesFuelTanks],
        [stats.warshipsCutters, increase.warshipsCutters],
        [stats.uavSystems, increase.uavSystems],
        [stats.specialMilitaryEquip, increase.specialMilitaryEquip],
        [stats.atgmSrbmSystems, increase.atgmSrbmSystems],
        [stats.cruiseMissiles, increase.cruiseMissiles],
      ];
    } on Response {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, String>>> getAllTerms(
      {required Endpoint endpoint}) async {
    try {
      final data = await apiServiceInterface.getAllTerms(endpoint: endpoint);
      return [
        data.personnelUnits,
        data.tanks,
        data.armouredFightingVehicles,
        data.artillerySystems,
        data.mlrs,
        data.aaWarfareSystems,
        data.planes,
        data.helicopters,
        data.vehiclesFuelTanks,
        data.warshipsCutters,
        data.uavSystems,
        data.specialMilitaryEquip,
        data.atgmSrbmSystems,
        data.cruiseMissiles,
      ];
    } on Response {
      rethrow;
    }
  }

  //* В этом классе, по идее, я должен получить EndpointData из APIService
  //* и расспределить её в понятную и простую структуру для исользования
  //* чтобы в UI уровне долучать данные в переменных
}
