// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermsData _$TermsDataFromJson(Map<String, dynamic> json) => TermsData(
      personnelUnits: Map<String, String>.from(json['personnel_units'] as Map),
      tanks: Map<String, String>.from(json['tanks'] as Map),
      armouredFightingVehicles:
          Map<String, String>.from(json['armoured_fighting_vehicles'] as Map),
      artillerySystems:
          Map<String, String>.from(json['artillery_systems'] as Map),
      mlrs: Map<String, String>.from(json['mlrs'] as Map),
      aaWarfareSystems:
          Map<String, String>.from(json['aa_warfare_systems'] as Map),
      planes: Map<String, String>.from(json['planes'] as Map),
      helicopters: Map<String, String>.from(json['helicopters'] as Map),
      vehiclesFuelTanks:
          Map<String, String>.from(json['vehicles_fuel_tanks'] as Map),
      warshipsCutters:
          Map<String, String>.from(json['warships_cutters'] as Map),
      cruiseMissiles: Map<String, String>.from(json['cruise_missiles'] as Map),
      uavSystems: Map<String, String>.from(json['uav_systems'] as Map),
      specialMilitaryEquip:
          Map<String, String>.from(json['special_military_equip'] as Map),
      atgmSrbmSystems:
          Map<String, String>.from(json['atgm_srbm_systems'] as Map),
    );

Map<String, dynamic> _$TermsDataToJson(TermsData instance) => <String, dynamic>{
      'personnel_units': instance.personnelUnits,
      'tanks': instance.tanks,
      'armoured_fighting_vehicles': instance.armouredFightingVehicles,
      'artillery_systems': instance.artillerySystems,
      'mlrs': instance.mlrs,
      'aa_warfare_systems': instance.aaWarfareSystems,
      'planes': instance.planes,
      'helicopters': instance.helicopters,
      'vehicles_fuel_tanks': instance.vehiclesFuelTanks,
      'warships_cutters': instance.warshipsCutters,
      'cruise_missiles': instance.cruiseMissiles,
      'uav_systems': instance.uavSystems,
      'special_military_equip': instance.specialMilitaryEquip,
      'atgm_srbm_systems': instance.atgmSrbmSystems,
    };
