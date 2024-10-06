import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:sigma/_core/routes/sigma_routes.dart';
import 'package:sigma/authentication/services/dio_service.dart';

part 'auth_screen_controller.g.dart';

class AuthScreenController = AuthScreenControllerBase
    with _$AuthScreenController;

abstract class AuthScreenControllerBase with Store {
  final dioService = DioService();
  @observable
  String email = '';

  @observable
  String? emailError;

  @observable
  String password = '';

  @observable
  String? passwordError;

  @observable
  String name = '';

  @observable
  String birthDate = '';

  @observable
  String phone = '';

  @observable
  String gender = '';

  @observable
  String address = '';

  @observable
  String cpf = '';

  @observable
  String cidCard = '';

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
  void setBirthDate(String value) {
    birthDate = value;
  }

  @action
  void setGender(String value) {
    gender = value;
  }

  @action
  void setCidCard(String value) {
    cidCard = value;
  }

  @action
  void validateEmail(String value) {
    email = value;
    if (value.isEmpty) {
      emailError = 'Campo obrigatório';
    } else {
      emailError = null;
    }
    if (!value.contains('@') && !value.contains('.com') && value.length < 10) {
      emailError = 'Email inválido!';
    } else {
      emailError = null;
    }
  }

  @action
  void validatePassword(String value) {
    password = value;
    if (value.isEmpty ||
        !RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,20}$')
            .hasMatch(value)) {
      passwordError =
          'A senha deve ser maior que 8 caracteres incluindo letras maiúsculas, minúsculas e números.';
    } else {
      passwordError = null;
    }
  }

  @action
  Future<void> login(
      BuildContext context, String email, String password) async {
    if (isAuthentication) {
      isLoading = true;
      try {
        validateEmail(email);
        validatePassword(password);

        final response = await dioService.postLogin(email, password);
        print(response);
        if (response.statusCode == 200) {
          print('Muda de telaaaaaaaaaaaaaaaaaaaaaaaa');
          Navigator.pushNamed(context, SigmaRoutes.home);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content:
                    Text('Erro ao fazer login. Verifique suas credenciais.')),
          );
        }
      } catch (e) {
        errorMessage = 'Erro durante o login: $e';
      } finally {
        isLoading = false;
      }
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

  @computed
  bool get isFormValid =>
      email.isNotEmpty &&
      password.isNotEmpty &&
      name.isNotEmpty &&
      phone.isNotEmpty &&
      address.isNotEmpty &&
      cpf.isNotEmpty;

  @computed
  bool get isValid => password != '' && email != '';
}
