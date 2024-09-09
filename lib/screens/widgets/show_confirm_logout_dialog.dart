import 'package:flutter/material.dart';
import 'package:sigma/_core/routes/sigma_routes.dart';

showConfirmLogoutDialog({
  required BuildContext context,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Deseja realmente sair do aplicativo?"),
        content: const SizedBox(
          height: 40,
          child: Column(
            children: [
              Text("Para sair do aplicativo, clique em SAIR."),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "NÃO",
              style: TextStyle(color: Colors.green),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, SigmaRoutes.auth);
            },
            child: const Text(
              "SAIR",
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      );
    },
  );
}
