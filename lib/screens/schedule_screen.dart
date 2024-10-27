// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sigma/_core/theme/sigma_colors.dart';
import 'package:sigma/controller/schedule_screen_controller.dart';
import 'package:sigma/screens/widgets/show_custom_snackbar.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final controller = ScheduleScreenController();
  String? chosenSpeciality = 'Especialidades';
  DateTime selectedDate = DateTime.now();
  DateTime selectedTime = DateTime.now();

  void _scheduleAppointment() {
    final String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
    final String formattedTime = DateFormat('HH:mm').format(selectedTime);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: const Icon(Icons.check_circle_outline_rounded,
              color: Colors.green, size: 80),
          title: const Text('Agendamento Confirmado'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Consulta agendada com sucesso!',
                  textAlign: TextAlign.center),
              Text('Especialidade: ${speciality[controller.specialityDoctor]!}',
                  textAlign: TextAlign.center),
              Text('Data: $formattedDate', textAlign: TextAlign.center),
              Text('Hora: $formattedTime', textAlign: TextAlign.center),
            ],
          ),
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

  final Map<String, DateTime> appointmentSlots = {
    '08:00': DateTime(2024, 11, 10, 8, 00),
    '09:00': DateTime(2024, 11, 10, 9, 00),
    '10:00': DateTime(2024, 11, 10, 10, 00),
    '11:00': DateTime(2024, 11, 10, 11, 00),
    '12:00': DateTime(2024, 11, 10, 12, 00),
    '13:00': DateTime(2024, 11, 10, 13, 00),
    '14:00': DateTime(2024, 11, 10, 14, 00),
    '15:00': DateTime(2024, 11, 10, 15, 00),
    '16:00': DateTime(2024, 11, 10, 16, 00),
    '17:00': DateTime(2024, 11, 10, 17, 00),
    '18:00': DateTime(2024, 11, 10, 18, 00),
  };
  final Map<String, String> speciality = {
    '1': 'Clinico Geral',
    '2': 'Nutricionista',
    '3': 'Fisioterapeuta',
    '4': 'Psicólogo',
  };

  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
    final String formattedTime = DateFormat('HH:mm').format(selectedTime);

    return Scaffold(
      backgroundColor: SigmaColors.blue,
      appBar: AppBar(
        title: const Text(
          'Agendar Consulta',
          style: TextStyle(color: Colors.black, fontSize: 28),
        ),
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
                    'Selecione a Especialidade:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  DropdownButton<String>(
                    hint: const Text('Espacialidades'),
                    value: null,
                    onChanged: (String? newValue) {
                      setState(() {
                        chosenSpeciality = newValue;
                        controller.specialityDoctor = newValue;
                      });
                    },
                    items: speciality.keys.map((String key) {
                      return DropdownMenuItem<String>(
                        value: key,
                        child: Text(speciality[key]!),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 10),
                   const Text(
                          'Selecione a data:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                  CalendarDatePicker(
                    initialDate: selectedDate,
                    firstDate: DateTime(2024),
                    lastDate: DateTime(2101),
                    onDateChanged: (DateTime date) {
                      if (date.weekday >= 1 && date.weekday <= 5) {
                        setState(() {
                          selectedDate = date;
                          controller.dateSchedule = date;
                          controller.dateScheduleString = DateFormat('dd/MM/yyyy').format(date);
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
                  Center(
                    child: Column(
                      children: [
                        const Text(
                          'Selecione o horário:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        DropdownButton<String>(
                          hint: const Text('Horários'),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedTime = appointmentSlots[newValue]!;
                              controller.hourSchedule = selectedTime;
                              controller.hourScheduleString =
                                  DateFormat('HH:mm').format(selectedTime);
                            });
                          },
                          items: appointmentSlots.keys
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (chosenSpeciality != null &&
                      chosenSpeciality != 'Especialidades') ...[
                    const Text(
                      "Especialidade: ",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "${speciality[chosenSpeciality!]}",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                  Text(
                    "Data: $formattedDate",
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    "Hora: $formattedTime",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      controller.addSchedule(
                        controller.specialityDoctor!,
                        1,
                        controller.dateScheduleString,
                        controller.hourScheduleString,
                      );
                      _scheduleAppointment();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: SigmaColors.blue,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text('Agendar Consulta'),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
