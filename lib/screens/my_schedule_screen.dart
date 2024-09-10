import 'package:flutter/material.dart';
import 'package:sigma/_core/routes/sigma_routes.dart';
import 'package:sigma/_core/theme/sigma_colors.dart';

class MyScheduleScreen extends StatefulWidget {
  const MyScheduleScreen({super.key});

  @override
  State<MyScheduleScreen> createState() => _MyScheduleScreenState();
}

class _MyScheduleScreenState extends State<MyScheduleScreen> {
  final isMyScheduleEmpty = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SigmaColors.blue,
      appBar: AppBar(
        title: const Row(
          children: [
            Text('Meus Agendamentos',
                style: TextStyle(color: Colors.black, fontSize: 28)),
          ],
        ),
      ),
      body: isMyScheduleEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/semconsultas.png",
                          height: 300,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Text(
                            'Não há agendamentos ainda!',
                            style: TextStyle(fontSize: 24, color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, SigmaRoutes.schedule);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: SigmaColors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Agendar Consulta',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : const Center(
              child: Text(
                'Bem-vindo à tela de meus agendamentos!',
                style: TextStyle(fontSize: 24, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
