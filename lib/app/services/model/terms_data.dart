import 'package:json_annotation/json_annotation.dart';

part 'terms_data.g.dart';

@JsonSerializable()
class TermsData {
  TermsData({
    required this.personnelUnits,
    required this.tanks,
    required this.armouredFightingVehicles,
    required this.artillerySystems,
    required this.mlrs,
    required this.aaWarfareSystems,
    required this.planes,
    required this.helicopters,
    required this.vehiclesFuelTanks,
    required this.warshipsCutters,
    required this.cruiseMissiles,
    required this.uavSystems,
    required this.specialMilitaryEquip,
    required this.atgmSrbmSystems,
  });

  @JsonKey(name: 'personnel_units')
  final Map<String, String> personnelUnits;
  final Map<String, String> tanks;
  @JsonKey(name: 'armoured_fighting_vehicles')
  final Map<String, String> armouredFightingVehicles;
  @JsonKey(name: 'artillery_systems')
  final Map<String, String> artillerySystems;
  final Map<String, String> mlrs;
  @JsonKey(name: 'aa_warfare_systems')
  final Map<String, String> aaWarfareSystems;
  final Map<String, String> planes;
  final Map<String, String> helicopters;
  @JsonKey(name: 'vehicles_fuel_tanks')
  final Map<String, String> vehiclesFuelTanks;
  @JsonKey(name: 'warships_cutters')
  final Map<String, String> warshipsCutters;
  @JsonKey(name: 'cruise_missiles')
  final Map<String, String> cruiseMissiles;
  @JsonKey(name: 'uav_systems')
  final Map<String, String> uavSystems;
  @JsonKey(name: 'special_military_equip')
  final Map<String, String> specialMilitaryEquip;
  @JsonKey(name: 'atgm_srbm_systems')
  final Map<String, String> atgmSrbmSystems;

  factory TermsData.fromJson(Map<String, dynamic> json) =>
      _$TermsDataFromJson(json);

  Map<String, dynamic> toJson() => _$TermsDataToJson(this);

  @override
  String toString() {
    return '''personnel Units: $personnelUnits, 
    tanks: $tanks, 
    armoured Fighting Vehicles: $armouredFightingVehicles, 
    artillery Systems: $artillerySystems, 
    mlrs: $mlrs,
    aa Warfare Systems: $aaWarfareSystems,
    planes: $planes,
    helicopters: $helicopters,
    warships Cutters: $warshipsCutters,
    vehicles Fuel Tanks: $vehiclesFuelTanks,
    cruise Missiles: $cruiseMissiles,
    uav Systems: $uavSystems,
    special Military Equip: $specialMilitaryEquip,
    atgm Srbm Systems: $atgmSrbmSystems''';
  }
}
