import 'package:luxury_golf_app/core/Models/employee_model.dart';
import 'package:luxury_golf_app/core/Models/states_enum.dart';
import 'package:luxury_golf_app/core/Models/customer_model.dart';

abstract class ServiceModel {
  final ServStatus status;
  final CustomerModel customerData;
  final Employee empData;
  final String location;
  final DateTime startDate;
  final DateTime? endDate;

  ServiceModel({
    required this.customerData,
    required this.empData,
    required this.location,
    required this.startDate,
    this.endDate,
    required this.status,
  });
}
