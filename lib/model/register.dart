
class Register {
  String name;
  String dataNascimento;
  String genero;
  String cpf;
  String cidCard;
  String endereco;
  String email;
  String password;

  Register({
    required this.name,
    required this.dataNascimento,
    required this.genero,
    required this.cpf,
    required this.cidCard,
    required this.endereco,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'data_nascimento': dataNascimento,
      'genero': genero,
      'cpf': cpf,
      'cid_card': cidCard,
      'endereco': endereco,
      'email': email,
      'password': password,
    };
  }

  Register copyWith({
    String? name,
    String? dataNascimento,
    String? genero,
    String? cpf,
    String? cidCard,
    String? endereco,
    String? email,
    String? password,
  }) {
    return Register(
      name: name ?? this.name,
      dataNascimento: dataNascimento ?? this.dataNascimento,
      genero: genero ?? this.genero,
      cpf: cpf ?? this.cpf,
      cidCard: cidCard ?? this.cidCard,
      endereco: endereco ?? this.endereco,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
