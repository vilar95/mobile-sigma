import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sigma/_core/routes/sigma_routes.dart';
import 'package:sigma/_core/theme/sigma_colors.dart';
import 'package:sigma/screens/widgets/drawer_widget.dart';
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
    _consultationsFuture =
        dioService.getPatientConsultations().then((response) {
      return response.map((consultation) {
        return {
          'id': consultation['id'],
          'doctorName': consultation['doctor']['name'],
          'specialty': consultation['doctor']['specialty']['name'],
          'date': consultation['data'],
          'horario': consultation['horario'],
        };
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
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
        final consultation = consultations.reversed.toList()[index];
        final consultationDate = DateTime.parse(consultation['date']);
        if (consultationDate
            .isBefore(DateTime.now().subtract(const Duration(days: 1)))) {
          return _buildEmptyState();
        }
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
              contentPadding: const EdgeInsets.all(16.0),
              title: Text(
                'Especialidade: ${consultation['specialty']}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Médico: ${consultation['doctorName']}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Data: ${DateFormat('dd/MM/yyyy').format(consultationDate)}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Hora: ${consultation['horario']}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete_outline_rounded,
                  color: SigmaColors.blue,
                ),
                onPressed: () {
                  showDeleteScheculeDialog(
                    context: context,
                    consultation: consultation,
                    index: index,
                    consultations: consultations,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  showDeleteScheculeDialog({
    required BuildContext context,
    required Map<String, dynamic> consultation,
    required int index,
    required List<dynamic> consultations,
  }) {
    final dioService = DioService();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(Icons.close_rounded, color: Colors.red, size: 80),
          title: const Text(
            'Deseja realmente cancelar a consulta?',
            textAlign: TextAlign.center,
          ),
          content: const SizedBox(
            height: 60,
            child: Column(
              children: [
                Text("Clique em sim para cancelar a consulta."),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                dioService.deleteConsultation(consultation['id']).then((_) {
                  setState(() {
                    consultations.removeAt(index);
                    Navigator.pop(context);
                  });
                });
              },
              child: const Text(
                "SIM",
                style: TextStyle(color: Colors.green),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "NÃO",
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        );
      },
    );
  }
}
