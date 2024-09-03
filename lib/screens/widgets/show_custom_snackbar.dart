import 'package:flutter/material.dart';

showCustomSnackBar({
  required BuildContext context,
  required String message,
  bool isError = true,
  bool showContinue = false,
}) {
  SnackBar snackBar = SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: (isError) ? Colors.red : Colors.green,
    action: showContinue
        ? SnackBarAction(
            label: "Tela Inicial",
            textColor: Colors.white,
            onPressed: () {},
          )
        : null,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
