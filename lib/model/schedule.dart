class Schedule {
  String idPatient;
  String patientName;
  String addressPatient;
  DateTime dateScheduled;
  DateTime hourScheduled;

  Schedule({
    required this.idPatient, 
    required this.patientName,
    required this.dateScheduled,
    required this.hourScheduled,
    required this.addressPatient,

  });
  Schedule.fromMap(Map<String, dynamic> map)
        : idPatient = map['idPatient'],
          patientName = map['patientName'],
          addressPatient = map['addressPatient'],
          dateScheduled = DateTime(
            map['appointmentDate'].day,
            map['appointmentDate'].month,
            map['appointmentDate'].year,
          ),
          hourScheduled = DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'idPatient': idPatient,
      'patientName': patientName,
      'appointmentDate': dateScheduled,
      'appointmentHour': hourScheduled,
      'addressPatient': addressPatient,
    };
  }

  void scheduleConsultation() {}

  void cancelConsultation() {}
}
