import 'package:flutter/material.dart';
//import 'package:sigma/_core/routes/sigma_routes.dart';
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
          'Consulta agendada com sucesso!',
          textAlign: TextAlign.center,
        ),
        content: const SizedBox(
          height: 60,
          child: Column(
            children: [
              Text("Clique em OK para vizualizar a consulta agendada."),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              //Navigator.pushNamed(context, SigmaRoutes.mySchedule);
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
