import 'package:luxury_golf_app/Admins/Models/emp_type.dart';
import 'package:luxury_golf_app/Admins/Models/permissions_model.dart';
import 'package:luxury_golf_app/Users/Models/user_model.dart';

class Employee extends User {
  String id = '';
  final List<Permissions> permissions;
  Employee({
    required super.name,
    required super.email,
    required super.photoURL,
    required super.passWord,
    required super.isLogined,
    required this.permissions,
  }) {
    id = genEmpID();
  }

  String genEmpID() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  @override
  Map<String, dynamic> toJson() {
    final empJsonData = super.toJson();
    empJsonData.addAll({'id': id , 'permissions' : permissions.toString()});
    return empJsonData;
  }
}
