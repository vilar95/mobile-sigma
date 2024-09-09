import 'package:flutter/material.dart';
import 'package:sigma/_core/theme/sigma_colors.dart';

class MyScheduleScreen extends StatefulWidget {

  const MyScheduleScreen({super.key});

  @override
  State<MyScheduleScreen> createState() => _MyScheduleScreenState();
}

class _MyScheduleScreenState extends State<MyScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SigmaColors.blue.shade400,
      appBar: AppBar(
        title: const Row(
          children: [
            Text('Meus Agendamentos'),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Bem-vindo à tela de meus agesdamentos!',
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}