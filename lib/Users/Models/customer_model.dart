import 'package:luxury_golf_app/Company%20Services/Models/service_model.dart';
import 'package:luxury_golf_app/Users/Models/user_model.dart';

class CustomerModel extends User {
  final List<ServiceModel> serviceHistory;

  CustomerModel({
    required super.name,
    required super.email,
    required super.photoURL,
    required super.passWord,
    required super.isLogined,
    required this.serviceHistory,
  });
}
