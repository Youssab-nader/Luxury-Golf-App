import 'package:luxury_golf_app/core/Models/service_model.dart';

class FixServiceModel extends ServiceModel {
  FixServiceModel({
    required super.customerData,
    required super.location,
    required super.empData,
    required super.startDate,
    required super.status,
    super.endDate,
  });
}
