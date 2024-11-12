// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:sigma/screens/widgets/show_custom_snackbar.dart';
import 'package:sigma/screens/widgets/show_send_support.dart';
import 'package:sigma/services/dio_service.dart';

part 'support_screen_controller.g.dart';

class SupportScreenController = _SupportScreenControllerBase
    with _$SupportScreenController;

abstract class _SupportScreenControllerBase with Store {
  final dioService = DioService();
  @observable
  String summaryMessage = '';

  @observable
  String message = '';

  @action
  void setMessage(String value) {
    message = value;
  }

  @action
  Future<void> sendMessage(
    BuildContext context,
    String message,
  ) async {
    try {
      final response = await dioService.postSupport(message);
      showConfirmSendMessageSupport(context: context);
      print(response.data);
      print('message: $message');
    } catch (e) {
      print('message: $message');
      showCustomSnackBar(
          context: context,
          message: 'Não foi possível enviar a mensagem de suporte.',
          duration: const Duration(seconds: 5));
    }
  }
}
