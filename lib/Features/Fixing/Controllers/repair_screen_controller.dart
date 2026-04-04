import 'package:flutter/foundation.dart';
import 'package:luxury_golf_app/core/Enums/fixing_section_enum.dart';

class SelectExpProblemsController extends ChangeNotifier {
  List<FixingProblemsEnum> allProblems = FixingProblemsEnum.values;
  List<FixingProblemsEnum> expectedProblems = [];

  void addProblem(FixingProblemsEnum problem) {
    expectedProblems.add(problem);
    notifyListeners();
  }

  void removeProblem(FixingProblemsEnum problem) {
    expectedProblems.remove(problem);
    notifyListeners();
  }
}
