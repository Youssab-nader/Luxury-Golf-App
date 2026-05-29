import 'package:flutter/material.dart';
import 'package:luxury_golf_app/core/Enums/fixing_section_enum.dart';
import 'package:luxury_golf_app/core/Models/requests_model.dart';

class FixServiceController extends ChangeNotifier {
  FixServiceRequestsModel request = FixServiceRequestsModel();

  final List<FixingProblemsEnum> allProblems = FixingProblemsEnum.values;

  void setCustomerInfo({
    required String name,
    required String phone,
    required String model,
    required String date,
    required String location,
  }) {
    request.customerName = name;
    request.customerPhoneNum = phone;
    request.carModel = model;
    request.reqDate = date;
    request.reqServiceLocation = location;
    initExpProblems();
    notifyListeners();
  }

  void addProblem(FixingProblemsEnum problem) {
    if (!request.expProblems!.contains(problem)) {
      request.expProblems!.add(problem);
      notifyListeners();
    }
  }

  void removeProblem(FixingProblemsEnum problem) {
    if (request.expProblems!.contains(problem)) {
      request.expProblems!.remove(problem);
      notifyListeners();
    }
  }

  void setProblemDescription(String description) {
    request.problemsDesc = description;

    notifyListeners();
  }

  void initExpProblems() {
    request.expProblems = [];

    notifyListeners();
  }
}
