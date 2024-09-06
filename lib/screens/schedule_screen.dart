import 'package:flutter/material.dart';
import 'package:sigma/_core/theme/sigma_colors.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SigmaColors.green,
      appBar: AppBar(
        title: const Text('Agendamento de Consulta'),
      ),
      body: const Center(
        child: Text(
          'Bem-vindo à tela de agendamento!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}