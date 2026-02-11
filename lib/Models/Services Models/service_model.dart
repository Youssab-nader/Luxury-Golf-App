import 'package:luxury_golf_app/Models/customer_model.dart';
import 'package:luxury_golf_app/Models/Services%20Models/location_model.dart';
import 'package:luxury_golf_app/Models/Services%20Models/states_enum.dart';

class ServiceModel {
  final CustomerModel custData;
  final String servName;
  final Position servLocation;
  final String servStartDate;
  final double servPrice;
  ServStatus currentServState = ServStatus.disabled;

  ServiceModel({
    required this.custData,
    required this.servName,
    required this.servLocation,
    required this.servStartDate,
    required this.servPrice,
  });
}
