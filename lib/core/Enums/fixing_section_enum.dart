enum FixingProblemsEnum {
  battery(
    problemName: 'Battery',
    problemIconPath: 'assets/icons/battary_icon.svg',
  ),

  charer(
    problemName: 'Charger',
    problemIconPath: 'assets/icons/charger_icon.svg',
  ),

  tires(
    problemName: 'Tires &\nBrakes',
    problemIconPath: 'assets/icons/tire_icon.svg',
  ),

  suspension(
    problemName: 'Suspension',
    problemIconPath: 'assets/icons/sus_icon.svg',
  ),

  lights(
    problemName: 'Lights &\nSignals',
    problemIconPath: 'assets/icons/light_icon.svg',
  ),

  body(
    problemName: 'Body &\nFrame',
    problemIconPath: 'assets/icons/body_icon.svg',
  ),

  seats(
    problemName: 'Seats &\nUpholstery',
    problemIconPath: 'assets/icons/seates_icon.svg',
  ),

  other(problemName: 'Other', problemIconPath: 'assets/icons/anOther_icon.svg');

  final String problemName;
  final String problemIconPath;

  const FixingProblemsEnum({
    required this.problemName,
    required this.problemIconPath,
  });
}
