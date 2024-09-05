import 'package:flutter/material.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendamento de Consulta'),
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