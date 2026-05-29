enum FixingProblemsEnum {
  battery(
    problemName: 'Battery',
    problemIconPath: 'assets/icons/battery_icon.svg',
  ),

  charger(
    problemName: 'Charger',
    problemIconPath: 'assets/icons/charger_icon.svg',
  ),

  tires(
    problemName: 'Tires & Brakes',
    problemIconPath: 'assets/icons/tire_icon.svg',
  ),

  suspension(
    problemName: 'Suspension',
    problemIconPath: 'assets/icons/sus_icon.svg',
  ),

  lights(
    problemName: 'Lights & Signals',
    problemIconPath: 'assets/icons/light_icon.svg',
  ),

  body(
    problemName: 'Body & Frame',
    problemIconPath: 'assets/icons/body_icon.svg',
  ),

  seats(
    problemName: 'Seats & Upholstery',
    problemIconPath: 'assets/icons/seats_icon.svg',
  ),

  other(problemName: 'Other', problemIconPath: 'assets/icons/anOther_icon.svg');

  final String problemName;
  final String problemIconPath;

  const FixingProblemsEnum({
    required this.problemName,
    required this.problemIconPath,
  });
}
