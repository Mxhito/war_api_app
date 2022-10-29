import 'package:json_annotation/json_annotation.dart';

part 'endpoint_data_model.g.dart';

@JsonSerializable()
class EndpointData {
  EndpointData({
    required this.date,
    required this.day,
    required this.resource,
    required this.stats,
    required this.increase,
  });

  final DateTime date;
  final int day;
  final String resource;
  final Stats stats;
  final Stats increase;

  factory EndpointData.fromJson(Map<String, dynamic> json) =>
      _$EndpointDataFromJson(json);

  Map<String, dynamic> toJson() => _$EndpointDataToJson(this);
}

@JsonSerializable()
class Stats {
  Stats({
    required this.personnelUnits,
    required this.tanks,
    required this.armouredFightingVehicles,
    required this.artillerySystems,
    required this.mlrs,
    required this.aaWarfareSystems,
    required this.planes,
    required this.helicopters,
    required this.vehiclesFuelTanks,
    required this.cruiseMissiles,
    required this.uavSystems,
    required this.specialMilitaryEquip,
    required this.atgmSrbmSystems,
  });

  @JsonKey(name: 'personnel_units')
  final int personnelUnits;
  final int tanks;
  @JsonKey(name: 'armoured_fighting_vehicles')
  final int armouredFightingVehicles;
  @JsonKey(name: 'artillery_systems')
  final int artillerySystems;
  final int mlrs;
  @JsonKey(name: 'aa_warfare_systems')
  final int aaWarfareSystems;
  final int planes;
  final int helicopters;
  @JsonKey(name: 'vehicles_fuel_tanks')
  final int vehiclesFuelTanks;
  @JsonKey(name: 'cruise_missiles')
  final int cruiseMissiles;
  @JsonKey(name: 'uav_systems')
  final int uavSystems;
  @JsonKey(name: 'special_military_equip')
  final int specialMilitaryEquip;
  @JsonKey(name: 'atgm_srbm_systems')
  final int atgmSrbmSystems;

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);

  Map<String, dynamic> toJson() => _$StatsToJson(this);
}
