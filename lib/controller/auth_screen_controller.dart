// ignore_for_file: use_build_context_synchronously, avoid_print
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigma/_core/routes/sigma_routes.dart';
import 'package:sigma/services/dio_service.dart';
import 'package:sigma/screens/widgets/show_confirm_register_dialog.dart';
import 'package:sigma/screens/widgets/show_custom_snackbar.dart';

part 'auth_screen_controller.g.dart';

class AuthScreenController = AuthScreenControllerBase
    with _$AuthScreenController;

abstract class AuthScreenControllerBase with Store {
  final dioService = DioService();

  @observable
  int id = 0;

  @observable
  String email = '';

  @observable
  String? emailError;

  @observable
  String password = '';

  @observable
  String? passwordValidationError;

  @observable
  String passwordConfirm = '';

  @observable
  String? passwordConfirmError;

  @observable
  String name = '';

  @observable
  String? nameError;

  @observable
  String birthDate = '';

  @observable
  String? birthDateError;

  @observable
  String gender = '';

  @observable
  String? genderError;

  @observable
  String address = '';

  @observable
  String? addressError;

  @observable
  String cpf = '';

  @observable
  String? cpfError;

  @observable
  String cidcard = '';

  @observable
  String? cidcardError;

  @observable
  bool isLoading = false;

  @observable
  bool isAuthentication = true;

  @observable
  String? errorMessage;

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
    cidcard = value;
  }

  @action
  void validateEmail(String value) {
    if (!value.contains('@') && !value.contains('.com') && value.length < 10) {
      emailError = 'Email inválido!';
    } 
    if (value.isEmpty) {
      emailError = 'Insira um e-mail válido.';
    }
  }

  @action
  void validatePassword(String value) {
    if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,20}$')
        .hasMatch(value)) {
      passwordValidationError =
          'A senha deve ser maior que 8 caracteres incluindo letras maiúsculas, minúsculas e números.';
    }
    if (value.isEmpty) {
      passwordValidationError = 'Insira a senha.';
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
          Navigator.pushNamed(context, SigmaRoutes.home);
          print('Login realizado com sucesso');
        }
      } catch (e) {
        errorMessage = 'Erro durante o login: $e';
        showCustomSnackBar(
            context: context,
            message: 'Não foi posssível realizar o login!',
            duration: const Duration(seconds: 5));
      } finally {
        isLoading = false;
      }
    }
  }

  @action
  void validateName(String value) {
    if (value.isEmpty) {
      nameError = 'Insira o nome completo.';
    }
  }

  @action
  void validateGender(String? value) {
    if (value != 'Masculino' && value != 'Feminino' && value != 'Não informar') {
      genderError = 'Selecione um gênero.';
    } 
  }

  @action
  void detectTypeDoc(String value) {
    if (value.isEmpty) {
      cpfError = 'Insira um CPF válido.';
    }
    final length = UtilBrasilFields.removeCaracteres(value).length;
    if (length != 11) {
      cpfError = 'Insira um CPF válido.';
    }
  }

  @action
  void validateCidCard(String value) {
    if (value.isEmpty) {
      cidcardError = 'Insira um cidCard válido.';
    }
    if (value.length < 9) {
      cidcardError = 'CidCard inválido.';
    }
  }

  @action
  void validateBirthDate(String value) {
    if (value.isEmpty) {
      birthDateError = 'Campo obrigatório';
    }
    if (value.length < 10) {
      birthDateError = 'Data de nascimento inválida.';
    }
  }

  @action
  void validateAddress(String value) {
    if (value.isEmpty) {
      addressError = 'Campo obrigatório';
    }
    if (value.length < 10) {
      addressError = 'Endereço inválido';
    }
  }

  @action
  Future<void> register(
    BuildContext context,
    String email,
    String password,
    String name,
    String birthDate,
    String gender,
    String cpf,
    String cidcard,
    String address,
  ) async {
    if (!isAuthentication) {
      isLoading = true;
      try {
        validateEmail(email);
        validatePassword(password);
        validateName(name);
        validateBirthDate(birthDate);
        validateCidCard(cidcard);
        validateAddress(address);
        detectTypeDoc(cpf);
        validateGender(gender);

        if (emailError != null ||
            passwordValidationError != null ||
            nameError != null ||
            birthDateError != null ||
            cidcardError != null ||
            addressError != null ||
            cpfError != null ||
            genderError != null) {
          showCustomSnackBar(
              context: context,
              message: 'Por favor, corrija os erros antes de continuar.',
              duration: const Duration(seconds: 5));
          isLoading = false;
          return;
        }

        final response = await dioService.postRegister(
            email, password, name, birthDate, gender, cpf, cidcard, address
            );
        if (response.statusCode == 200) {
          print('Cadastro realizado com sucesso');
          showConfirmRegisterDialog(
            context: context,
            email: email,
          );
        }
      } catch (e) {
        errorMessage = 'Erro durante o cadastro: $e';
        showCustomSnackBar(
            context: context,
            message: 'Não foi posssível realizar o cadastro!',
            duration: const Duration(seconds: 5));
      } finally {
        isLoading = false;
      }
    }
  }

  @action
  Future<void> getRegistrationApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt('id');
    String? email = prefs.getString('email');
    String? password = prefs.getString('password');
    String? name = prefs.getString('name');
    String? birthDate = prefs.getString('data_nascimento');
    String? gender = prefs.getString('genero');
    String? cpf = prefs.getString('cpf');
    String? cidcard = prefs.getString('cidcard');
    String? address = prefs.getString('endereco');

    setId(id!);
    setEmail(email!);
    setPassword(password!);
    setName(name!);
    setBirthDate(birthDate!);
    setGender(gender!);
    setCpf(cpf!);
    setCidCard(cidcard!);
    setAddress(address!);

  }
}

void setId(int id) {
  id = id;
}
