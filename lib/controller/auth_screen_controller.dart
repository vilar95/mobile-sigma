import 'package:mobx/mobx.dart';
import 'package:brasil_fields/brasil_fields.dart';

part 'auth_screen_controller.g.dart';

class AuthScreenController = AuthScreenControllerBase
    with _$AuthScreenController;

abstract class AuthScreenControllerBase with Store {
  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String name = '';

  @observable
  String phone = '';

  @observable
  String address = '';

  @observable
  String cpf = '';

  @observable
  bool isLoading = false;

  @observable
  bool isAuthentication = true;

  @observable
  String errorMessage = '';

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setName(String value) {
    name = value;
  }

  @action
  void setPhone(String value) {
    phone = value;
  }

  @action
  void setAddress(String value) {
    address = value;
  }

  @action
  void setCpf(String value) {
    cpf = value;
  }

  @action
  void validateEmail(String value) {
    if (value.isEmpty) {
      errorMessage = 'Campo obrigatório';
    }
    if (!value.contains('@') && !value.contains('.com') && value.length < 10) {
      errorMessage = 'Email inválido!';
    }
  }

  @action
  void validatePassword(String value) {
    if (!RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.*?[0-9])^.{6,10}$')
        .hasMatch(value)) {
      errorMessage =
          'Senha deve conter entre 6 e 10 caracteres incluindo letras maiúsculas, minúsculas e números.';
      return;
    }
  }

  @action
  void validateName(String value) {
    if (value.isEmpty) {
      errorMessage = 'Campo obrigatório';
    }
    if (value.length < 3) {
      errorMessage = 'Nome inválido';
    }
  }

  @action
  void validatePhone(String value) {
    if (value.isEmpty) {
      errorMessage = 'Campo obrigatório';
    }
    if (value.length < 11) {
      errorMessage = 'Telefone inválido';
    }
  }

  @action
  void detectTypeDoc(String value) {
    final length = UtilBrasilFields.removeCaracteres(value).length;
    if (length == 11) {
      setCpf(value);
    }
    errorMessage = 'CPF inválido';
  }

  @action
  Future<void> login() async {
    isLoading = true;
  }

  @computed
  bool get isFormValid =>
      email.isNotEmpty &&
      password.isNotEmpty &&
      name.isNotEmpty &&
      phone.isNotEmpty &&
      address.isNotEmpty &&
      cpf.isNotEmpty;
}

