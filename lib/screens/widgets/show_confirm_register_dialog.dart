import 'package:flutter/material.dart';
import 'package:sigma/_core/theme/sigma_colors.dart';
import 'package:sigma/controller/auth_screen_controller.dart';

showConfirmRegisterDialog({
  required BuildContext context,
  required String email,
}) {
  final controller = AuthScreenController();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        icon: const Icon(Icons.check_circle_outline_rounded,
            color: Colors.green, size: 80),
        title: const Text(
          'Cadastro realizado com sucesso!',
          textAlign: TextAlign.center,
        ),
        content: SizedBox(
          height: 70,
          child: Column(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(text: "Faça o login com o e-mail: "),
                    TextSpan(
                      text: email,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(text: ", \n para acessar o aplicativo."),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              controller.isAuthentication;
            },
            child: Text(
              "Confirmar",
              style: TextStyle(color: SigmaColors.blue[400]),
            ),
          )
        ],
      );
    },
  );
}
