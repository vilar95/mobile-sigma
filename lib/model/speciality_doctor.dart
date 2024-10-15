// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:sigma/authentication/services/dio_service.dart';

class SpecialityDoctor {
  final String id; 
  final String speciality;
  final DioService dioService = DioService();

  SpecialityDoctor({
    required this.id,
    required this.speciality,
  });

  factory SpecialityDoctor.fromJson(Map<String, dynamic> json) {
    return SpecialityDoctor(
      id: json['id'].toString(), 
      speciality: json['speciality'], 
    );
  }

  SpecialityDoctor copyWith({
    String? id,
    String? speciality,
  }) {
    return SpecialityDoctor(
      id: id ?? this.id,
      speciality: speciality ?? this.speciality,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'speciality': speciality,
    };
  }

  factory SpecialityDoctor.fromMap(Map<String, dynamic> map) {
    return SpecialityDoctor(
      id: map['id'] as String,
      speciality: map['speciality'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SpecialityDoctor.fromJsonString(String source) => SpecialityDoctor.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SpecialityDoctor(id: $id, speciality: $speciality)';

  @override
  bool operator ==(covariant SpecialityDoctor other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.speciality == speciality;
  }

  @override
  int get hashCode => id.hashCode ^ speciality.hashCode;
}
