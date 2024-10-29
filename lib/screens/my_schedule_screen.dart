import 'package:flutter/material.dart';
import 'package:sigma/_core/routes/sigma_routes.dart';
import 'package:sigma/_core/theme/sigma_colors.dart';
import 'package:sigma/services/dio_service.dart';

class MyScheduleScreen extends StatefulWidget {
  const MyScheduleScreen({super.key});

  @override
  State<MyScheduleScreen> createState() => _MyScheduleScreenState();
}

class _MyScheduleScreenState extends State<MyScheduleScreen> {
  final DioService dioService = DioService();
  late Future<List<dynamic>> _consultationsFuture;

  @override
  void initState() {
    super.initState();
    _consultationsFuture = dioService.getPatientConsultations().then((response) {
      return response.map((consultation) {
        return {
          'id': consultation['id'],
          'doctorName': consultation['doctor']['name'],
          'specialty': consultation['doctor']['specialty']['name'],
          'date': consultation['data'],
          'time': consultation['hora'],
        };
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SigmaColors.blue,
      appBar: AppBar(
        title: const Text('Meus Agendamentos',
            style: TextStyle(color: Colors.black, fontSize: 28)),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _consultationsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return _buildEmptyState();
          } else {
            return _buildConsultationsList(snapshot.data!);
          }
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
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
                Image.asset("assets/semconsultas.png", height: 300),
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
    );
  }

  Widget _buildConsultationsList(List<dynamic> consultations) {
    return ListView.builder(
      itemCount: consultations.length,
      itemBuilder: (context, index) {
        final consultation = consultations[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              title: Text('Especialidade: ${consultation['specialty']}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Médico: ${consultation['doctorName']}'),
                  Text('Data: ${consultation['date']}'),
                  Text('Hora: ${consultation['time']}'),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline_rounded, color: Colors.red),
                onPressed: () {
                  // Implement delete functionality
                },
              ),
            ),
          ),
        );
      },
    );
  }
}