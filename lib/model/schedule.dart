import 'dart:convert';

class Schedule {
  String idPatient;
  String patientName;
  String addressPatient;
  DateTime dateScheduled;
  DateTime hourScheduled;

  Schedule({
    required this.idPatient,
    required this.patientName,
    required this.addressPatient,
    required this.dateScheduled,
    required this.hourScheduled,
  });

  

  Schedule copyWith({
    String? idPatient,
    String? patientName,
    String? addressPatient,
    DateTime? dateScheduled,
    DateTime? hourScheduled,
  }) {
    return Schedule(
      idPatient: idPatient ?? this.idPatient,
      patientName: patientName ?? this.patientName,
      addressPatient: addressPatient ?? this.addressPatient,
      dateScheduled: dateScheduled ?? this.dateScheduled,
      hourScheduled: hourScheduled ?? this.hourScheduled,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idPatient': idPatient,
      'patientName': patientName,
      'addressPatient': addressPatient,
      'dateScheduled': dateScheduled.millisecondsSinceEpoch,
      'hourScheduled': hourScheduled.millisecondsSinceEpoch,
    };
  }

  factory Schedule.fromMap(Map<String, dynamic> map) {
    return Schedule(
      idPatient: map['idPatient'] as String,
      patientName: map['patientName'] as String,
      addressPatient: map['addressPatient'] as String,
      dateScheduled: DateTime.fromMillisecondsSinceEpoch(map['dateScheduled'] as int),
      hourScheduled: DateTime.fromMillisecondsSinceEpoch(map['hourScheduled'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Schedule.fromJson(String source) => Schedule.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Schedule(idPatient: $idPatient, patientName: $patientName, addressPatient: $addressPatient, dateScheduled: $dateScheduled, hourScheduled: $hourScheduled)';
  }

  @override
  bool operator ==(covariant Schedule other) {
    if (identical(this, other)) return true;
  
    return 
      other.idPatient == idPatient &&
      other.patientName == patientName &&
      other.addressPatient == addressPatient &&
      other.dateScheduled == dateScheduled &&
      other.hourScheduled == hourScheduled;
  }

  @override
  int get hashCode {
    return idPatient.hashCode ^
      patientName.hashCode ^
      addressPatient.hashCode ^
      dateScheduled.hashCode ^
      hourScheduled.hashCode;
  }
}
