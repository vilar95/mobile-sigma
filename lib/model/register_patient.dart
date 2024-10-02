// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterPatient {
  String name;
  String email;
  String password;
  String passwordConfirmation;
  RegisterPatient({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  

  RegisterPatient copyWith({
    String? name,
    String? email,
    String? password,
    String? passwordConfirmation,
  }) {
    return RegisterPatient(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'passwordConfirmation': passwordConfirmation,
    };
  }

  factory RegisterPatient.fromMap(Map<String, dynamic> map) {
    return RegisterPatient(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      passwordConfirmation: map['passwordConfirmation'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterPatient.fromJson(String source) => RegisterPatient.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegisterPatient(name: $name, email: $email, password: $password, passwordConfirmation: $passwordConfirmation)';
  }

  @override
  bool operator ==(covariant RegisterPatient other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.password == password &&
      other.passwordConfirmation == passwordConfirmation;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      passwordConfirmation.hashCode;
  }
}
