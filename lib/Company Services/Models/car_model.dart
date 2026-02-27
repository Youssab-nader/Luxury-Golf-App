import 'dart:io';

import 'package:luxury_golf_app/Company%20Services/Models/num_of_seats_model.dart';
import 'package:luxury_golf_app/Company%20Services/Models/spar_parts_model.dart';

class CarModel {
  final String brandName;
  final String chassisNum;
  final List<File> imagesPaths;
  final String color;
  final NumOfSeats numOfSeats;
  final String model;
  final String modelYear;

  CarModel({
    required this.color,
    required this.chassisNum,
    required this.imagesPaths,
    required this.numOfSeats,
    required this.modelYear,
    required this.brandName,
    required this.model,
  });
}

class CompanyCarModel extends CarModel {
  String id = '';
  double rentPricePerDay;
  final int? carRate;
  final bool isAvailable;

  CompanyCarModel({
    this.carRate,
    required this.rentPricePerDay,
    required this.isAvailable,
    required super.color,
    required super.chassisNum,
    required super.imagesPaths,
    required super.numOfSeats,
    required super.modelYear,
    required super.brandName,
    required super.model,
  }) {
    genCarID();
  }

  void genCarID() {
    final String carId;
    carId =
        brandName[0] +
        model[0] +
        color[0] +
        chassisNum[0] +
        chassisNum[1] +
        chassisNum[2];
    id = carId;
  }
}

class CustomerCarModel extends CarModel {
  final bool? isUnderMaintenance;
  DateTime? lastMaintenanceDate;
  final List fixinfHistiry;
  final List<String> carEquipment;
  final double km;
  final String ownerName;
  final String ownerAddress;
  final List<SparPartsModel> sparParts;

  CustomerCarModel({
    this.lastMaintenanceDate,
    required this.isUnderMaintenance,
    required this.carEquipment,
    required this.km,
    required this.fixinfHistiry,
    required this.ownerName,
    required this.ownerAddress,
    required this.sparParts,
    required super.chassisNum,
    required super.imagesPaths,
    required super.numOfSeats,
    required super.modelYear,
    required super.color,
    required super.brandName,
    required super.model,
  });
}
