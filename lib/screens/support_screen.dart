import 'package:flutter/material.dart';
import 'package:sigma/_core/theme/sigma_colors.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SigmaColors.blue.shade400,
      appBar: AppBar(
        title: const Text('Agendamento de Consulta'),
      ),
      body: const Center(
        child: Text(
          'Bem-vindo à tela de suporte!',
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
