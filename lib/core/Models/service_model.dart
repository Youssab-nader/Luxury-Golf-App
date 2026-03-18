import 'package:luxury_golf_app/core/Models/employee_model.dart';
import 'package:luxury_golf_app/core/Models/requests_model.dart';
import 'package:luxury_golf_app/core/Models/states_enum.dart';
import 'package:luxury_golf_app/core/Models/customer_model.dart';

class ServiceModel {
  final String name;
  final ServStatus status;
  final RequestsModel request;
  final CustomerModel customerData;
  final Employee empData;
  final String location;
  final DateTime startDate;
  final DateTime endDate;

  ServiceModel({
    required this.name,
    required this.customerData,
    required this.empData,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.request,
  });
}
