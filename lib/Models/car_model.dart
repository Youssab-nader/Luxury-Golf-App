class CarModel {
  final String carType;
  final List<String> carImagePaths;
  final String carID;
  final String carColor;
  final String? plateNumber;
  final int numOfSeats;
  final int carModelYear;

  CarModel({
    this.plateNumber,
    required this.carColor,
    required this.carType,
    required this.carImagePaths,
    required this.carID,
    required this.numOfSeats,
    required this.carModelYear,
  });
}

class CompanyCarModel extends CarModel {
  double rentPricePerDay;
  final int? carRate;
  bool isAvailable = true;

  CompanyCarModel({
    this.carRate,
    super.plateNumber,
    required this.rentPricePerDay,
    required super.carColor,
    required super.carType,
    required super.carImagePaths,
    required super.carID,
    required super.numOfSeats,
    required super.carModelYear,
  });

  void setRentPricePerDay(double price) {
    rentPricePerDay = price;
  }

  void renting() {
    isAvailable = false;
  }

  void comeBack() {
    isAvailable = true;
  }
}

class CustomerCarModel extends CarModel {
  final bool? isUnderMaintenance;
  DateTime? lastMaintenanceDate;
  final List<String> carEquipment;
  final double km;
  final String ownerName;
  final String ownerAddress;

  CustomerCarModel({
    super.plateNumber,
    this.lastMaintenanceDate,
    required this.isUnderMaintenance,
    required this.carEquipment,
    required this.km,
    required this.ownerName,
    required this.ownerAddress,
    required super.carType,
    required super.carImagePaths,
    required super.carID,
    required super.numOfSeats,
    required super.carModelYear,
    required super.carColor,
  });
}
