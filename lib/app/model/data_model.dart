class Data {
  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      date: DateTime.parse(json['date']),
      day: json['day'] as int,
      resource: json['resource'] as String,
      stats: Stats.fromJson(json['stats']),
      increase: Stats.fromJson(json['increase']),
    );
  }
}

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

  final int personnelUnits;
  final int tanks;
  final int armouredFightingVehicles;
  final int artillerySystems;
  final int mlrs;
  final int aaWarfareSystems;
  final int planes;
  final int helicopters;
  final int vehiclesFuelTanks;
  final int cruiseMissiles;
  final int uavSystems;
  final int specialMilitaryEquip;
  final int atgmSrbmSystems;

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
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
  }
}
