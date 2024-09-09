import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Adicione esta linha para importar a biblioteca intl
import 'package:sigma/_core/theme/sigma_colors.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  String _selectedDoctor = 'Especialidade1';
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  final Map<String, String> _doctorSpecialties = const {
    'Especialidade1': 'Clínico Geral',
    'Especialidade2': 'Fisioterapeuta',
    'Especialidade3': 'Cardiologista',
    'Especialidade4': 'Dermatologista',
    'Especialidade5': 'Nutricionista',
    'Especialidade6': 'Ortopedista',
    'Especialidade7': 'Oftalmologista',
    'Especialidade8': 'Neurologista',
    'Especialidade9': 'Endocrinologista',
    'Especialidade10': 'Urologista',
    'Especialidade11': 'Gastroenterologista',
  };

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _scheduleAppointment() {
    final String formattedDate = DateFormat('dd/MM/yyyy').format(_selectedDate);
    final String appointmentDetails =
        'Agendado com ${_doctorSpecialties[_selectedDoctor]} em $formattedDate às ${_selectedTime.format(context)}';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: const Icon(Icons.check_circle_outline_rounded,
              color: Colors.green, size: 80),
          title: const Text('Agendamento Confirmado'),
          content: Text(appointmentDetails, textAlign: TextAlign.center),
          actions: <Widget>[
            TextButton(
              child: Text('OK',
                  style: TextStyle(color: SigmaColors.blue.shade400)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat('dd/MM/yyyy').format(_selectedDate);
    return Scaffold(
      backgroundColor: SigmaColors.blue.shade400,
      appBar: AppBar(
        title: const Text('Agendamento de Consulta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Selecione a Especialidade',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: _selectedDoctor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: SigmaColors.blue.shade400)),
                      filled: true,
                      fillColor: Colors.white,
                      iconColor: SigmaColors.blue.shade400,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedDoctor = newValue!;
                      });
                    },
                    items: _doctorSpecialties.keys
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(_doctorSpecialties[value]!),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 30),
                    CalendarDatePicker(
                    initialDate: _selectedDate,
                    firstDate: DateTime(2024),
                    lastDate: DateTime(2101),
                    onDateChanged: (DateTime date) {                      
                      if (date.weekday >= 1 && date.weekday <= 5) {
                      setState(() {
                        _selectedDate = date;
                      });
                      }
                    },
                    ),
                  ElevatedButton.icon(
                    onPressed: () => _selectTime(context),
                    icon: const Icon(Icons.access_time, color: Colors.white),
                    label: const Text('Selecionar Hora'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: SigmaColors.blue.shade400,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Data: $formattedDate",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Hora: ${_selectedTime.format(context)}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: _scheduleAppointment,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: SigmaColors.blue.shade400,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text('Agendar Consulta'),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
