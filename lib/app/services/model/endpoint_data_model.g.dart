// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endpoint_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EndpointData _$EndpointDataFromJson(Map<String, dynamic> json) => EndpointData(
      date: DateTime.parse(json['date'] as String),
      day: json['day'] as int,
      resource: json['resource'] as String,
      stats: Stats.fromJson(json['stats'] as Map<String, dynamic>),
      increase: Stats.fromJson(json['increase'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EndpointDataToJson(EndpointData instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'day': instance.day,
      'resource': instance.resource,
      'stats': instance.stats,
      'increase': instance.increase,
    };

Stats _$StatsFromJson(Map<String, dynamic> json) => Stats(
      personnelUnits: json['personnel_units'] as int,
      tanks: json['tanks'] as int,
      armouredFightingVehicles: json['armoured_fighting_vehicles'] as int,
      artillerySystems: json['artillery_systems'] as int,
      mlrs: json['mlrs'] as int,
      aaWarfareSystems: json['aa_warfare_systems'] as int,
      planes: json['planes'] as int,
      helicopters: json['helicopters'] as int,
      vehiclesFuelTanks: json['vehicles_fuel_tanks'] as int,
      cruiseMissiles: json['cruise_missiles'] as int,
      uavSystems: json['uav_systems'] as int,
      specialMilitaryEquip: json['special_military_equip'] as int,
      atgmSrbmSystems: json['atgm_srbm_systems'] as int,
    );

Map<String, dynamic> _$StatsToJson(Stats instance) => <String, dynamic>{
      'personnel_units': instance.personnelUnits,
      'tanks': instance.tanks,
      'armoured_fighting_vehicles': instance.armouredFightingVehicles,
      'artillery_systems': instance.artillerySystems,
      'mlrs': instance.mlrs,
      'aa_warfare_systems': instance.aaWarfareSystems,
      'planes': instance.planes,
      'helicopters': instance.helicopters,
      'vehicles_fuel_tanks': instance.vehiclesFuelTanks,
      'cruise_missiles': instance.cruiseMissiles,
      'uav_systems': instance.uavSystems,
      'special_military_equip': instance.specialMilitaryEquip,
      'atgm_srbm_systems': instance.atgmSrbmSystems,
    };
