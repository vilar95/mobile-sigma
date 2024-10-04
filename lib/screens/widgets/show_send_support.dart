
    import 'package:flutter/material.dart';
import 'package:sigma/_core/theme/sigma_colors.dart';
import 'package:sigma/authentication/model/mock_user.dart';

void showConfirmSendMessageSupport({required BuildContext context}) {
    final MockUser user = MockUser(); // Replace 'MockUser()' with the appropriate value
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(Icons.check_circle_outline_rounded,
              color: Colors.green, size: 80),
          title: const Text('Mensagem enviada com sucesso!'),
          content: Text('Enviarem uma resposta ao e-mail ${user.email!}, para dar continuidade no atendimento!',textAlign: TextAlign.center),
          actions: <Widget>[
            TextButton(
              child:
                  const Text('OK', style: TextStyle(color: SigmaColors.blue)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

