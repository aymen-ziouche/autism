class Patient {


  String? uid;  // Now nullable
  final String firstName;
  final String lastName;
  final String gender;
  final DateTime dateOfBirth;
  final int autismDegree;
  Patient({
    this.uid,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.dateOfBirth,
    required this.autismDegree,
  });
}
