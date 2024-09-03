import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendamento de Consulta'),
      ),
      body: const Center(
        child: Text(
          'Bem-vindo à tela de home!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}