// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_screen_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthScreenController on AuthScreenControllerBase, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'AuthScreenControllerBase.isFormValid'))
          .value;

  late final _$emailAtom =
      Atom(name: 'AuthScreenControllerBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'AuthScreenControllerBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$nameAtom =
      Atom(name: 'AuthScreenControllerBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$phoneAtom =
      Atom(name: 'AuthScreenControllerBase.phone', context: context);

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$addressAtom =
      Atom(name: 'AuthScreenControllerBase.address', context: context);

  @override
  String get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(String value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  late final _$cpfAtom =
      Atom(name: 'AuthScreenControllerBase.cpf', context: context);

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'AuthScreenControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isAuthenticationAtom =
      Atom(name: 'AuthScreenControllerBase.isAuthentication', context: context);

  @override
  bool get isAuthentication {
    _$isAuthenticationAtom.reportRead();
    return super.isAuthentication;
  }

  @override
  set isAuthentication(bool value) {
    _$isAuthenticationAtom.reportWrite(value, super.isAuthentication, () {
      super.isAuthentication = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'AuthScreenControllerBase.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('AuthScreenControllerBase.login', context: context);

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$AuthScreenControllerBaseActionController =
      ActionController(name: 'AuthScreenControllerBase', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo = _$AuthScreenControllerBaseActionController.startAction(
        name: 'AuthScreenControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$AuthScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$AuthScreenControllerBaseActionController.startAction(
        name: 'AuthScreenControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$AuthScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$AuthScreenControllerBaseActionController.startAction(
        name: 'AuthScreenControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$AuthScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$AuthScreenControllerBaseActionController.startAction(
        name: 'AuthScreenControllerBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$AuthScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAddress(String value) {
    final _$actionInfo = _$AuthScreenControllerBaseActionController.startAction(
        name: 'AuthScreenControllerBase.setAddress');
    try {
      return super.setAddress(value);
    } finally {
      _$AuthScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCpf(String value) {
    final _$actionInfo = _$AuthScreenControllerBaseActionController.startAction(
        name: 'AuthScreenControllerBase.setCpf');
    try {
      return super.setCpf(value);
    } finally {
      _$AuthScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail(String value) {
    final _$actionInfo = _$AuthScreenControllerBaseActionController.startAction(
        name: 'AuthScreenControllerBase.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$AuthScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$AuthScreenControllerBaseActionController.startAction(
        name: 'AuthScreenControllerBase.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$AuthScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateName(String value) {
    final _$actionInfo = _$AuthScreenControllerBaseActionController.startAction(
        name: 'AuthScreenControllerBase.validateName');
    try {
      return super.validateName(value);
    } finally {
      _$AuthScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePhone(String value) {
    final _$actionInfo = _$AuthScreenControllerBaseActionController.startAction(
        name: 'AuthScreenControllerBase.validatePhone');
    try {
      return super.validatePhone(value);
    } finally {
      _$AuthScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void detectTypeDoc(String value) {
    final _$actionInfo = _$AuthScreenControllerBaseActionController.startAction(
        name: 'AuthScreenControllerBase.detectTypeDoc');
    try {
      return super.detectTypeDoc(value);
    } finally {
      _$AuthScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
name: ${name},
phone: ${phone},
address: ${address},
cpf: ${cpf},
isLoading: ${isLoading},
isAuthentication: ${isAuthentication},
errorMessage: ${errorMessage},
isFormValid: ${isFormValid}
    ''';
  }
}
