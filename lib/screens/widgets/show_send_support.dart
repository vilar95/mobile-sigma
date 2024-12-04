import 'package:flutter/material.dart';
import 'package:sigma/_core/theme/sigma_colors.dart';
import 'package:sigma/controller/auth_screen_controller.dart';
import 'package:sigma/screens/support_screen.dart';

void showConfirmSendMessageSupport({required BuildContext context}) {
  final AuthScreenController controller = AuthScreenController();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        icon: const Icon(Icons.check_circle_outline_rounded,
            color: Colors.green, size: 80),
        title: const Text('Mensagem enviada com sucesso!'),
        content: Text(
            'Enviarem uma resposta ao e-mail ${controller.email}, para dar continuidade no atendimento!',
            textAlign: TextAlign.center),
        actions: <Widget>[
          TextButton(
            child: const Text('OK', style: TextStyle(color: SigmaColors.blue)),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const SupportScreen()),
              );
            },
          ),
        ],
      );
    },
  );
}
