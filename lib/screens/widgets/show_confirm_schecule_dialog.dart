import 'package:flutter/material.dart';
import 'package:sigma/_core/theme/sigma_colors.dart';

showConfirmScheculeDialog({
  required BuildContext context,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        icon: const Icon(Icons.check_circle_outline_rounded,
            color: Colors.green, size: 80),
        title: const Text(
          'Consulta agendada!',
          textAlign: TextAlign.center,
        ),
        content: const SizedBox(
          height: 70,
          child: Column(
            children: [
              Text("Clique em OK para retornar."),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "OK",
              style: TextStyle(color: SigmaColors.blue[400]),
            ),
          )
        ],
      );
    },
  );
}
