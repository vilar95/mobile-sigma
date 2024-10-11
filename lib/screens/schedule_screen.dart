import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Adicione esta linha para importar a biblioteca intl
import 'package:sigma/_core/theme/sigma_colors.dart';
import 'package:sigma/model/speciality_doctor.dart';
import 'package:sigma/screens/widgets/show_custom_snackbar.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  String? _chosenSpecialty = 'Especialidades';
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

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
   final List<SpecialityDoctor> _doctorSpecialties = [];



  void _scheduleAppointment() {
    final String formattedDate = DateFormat('dd/MM/yyyy').format(_selectedDate);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: const Icon(Icons.check_circle_outline_rounded,
              color: Colors.green, size: 80),
          title: const Text('Agendamento Confirmado'),
          content: Text('appointmentDetails', textAlign: TextAlign.center),
          actions: <Widget>[
            TextButton(
              child:
                  const Text('OK', style: TextStyle(color: SigmaColors.blue)),
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
      backgroundColor: SigmaColors.blue,
      appBar: AppBar(
        title: const Text('Agendar Consulta',
            style: TextStyle(
                color: Colors.black,
                fontSize: 28)),
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
                  DropdownButton<SpecialityDoctor>(
                    hint: const Text('Selecione uma especialidade'),
                    value: _chosenSpecialty != 'Especialidades'
                        ? _doctorSpecialties.firstWhere(
                            (specialty) => specialty.speciality == _chosenSpecialty,
                            orElse: () => _doctorSpecialties.first)
                        : null,
                    onChanged: (SpecialityDoctor? newValue) {
                      setState(() {
                        _chosenSpecialty = newValue?.speciality;
                      });
                    },
                    items: _doctorSpecialties.map((SpecialityDoctor specialityDoctor) {
                      return DropdownMenuItem<SpecialityDoctor>(
                        value: specialityDoctor,
                        child: Text(specialityDoctor.speciality),
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
                      } else {
                        showCustomSnackBar(
                            context: context,
                            message:
                                "Apenas dias úteis são permitidos para agendamento.",
                            duration: const Duration(seconds: 6));
                      }
                    },
                  ),
                  ElevatedButton.icon(
                    onPressed: () => _selectTime(context),
                    icon: const Icon(Icons.access_time, color: Colors.white),
                    label: const Text('Selecionar Hora'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: SigmaColors.blue,
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
                      backgroundColor: SigmaColors.blue,
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
