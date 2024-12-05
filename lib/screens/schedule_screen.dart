// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sigma/_core/theme/sigma_colors.dart';
import 'package:sigma/controller/schedule_screen_controller.dart';
import 'package:sigma/screens/widgets/drawer_widget.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final controller = ScheduleScreenController();
  String? chosenSpeciality;
  DateTime selectedDate = DateTime.now();
  DateTime selectedTime = DateTime.now();

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
    '2': 'Dentista',
    '3': 'Fisioterapeuta',
    '4': 'Fonoaudiólogo',
    '5': 'Nutricionista',
    '6': 'Psicólogo',
  };

  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
    final String formattedTime = DateFormat('HH:mm').format(selectedTime);

    return Scaffold(
      drawer: const DrawerWidget(),
      backgroundColor: SigmaColors.blue,
      appBar: AppBar(
        title: const Text(
          'Agendar Consulta',
          style: TextStyle(color: SigmaColors.blue, fontSize: 28),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Selecione a Especialidade:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: SigmaColors.blue,
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(
                          color: SigmaColors.blue, fontSize: 18),
                      underline: Container(
                        height: 2,
                        color: SigmaColors.blue,
                      ),
                      hint: const Text('Especialidades'),
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
                      value: null,
                    ),
                  ),
                  Column(
                    children: [
                      const Text(
                        'Selecione a data:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CalendarDatePicker(
                            initialDate:
                                DateTime.now().add(const Duration(days: 1)),
                            firstDate: DateTime.now(),
                            lastDate:
                                DateTime.now().add(const Duration(days: 90)),
                            selectableDayPredicate: (day) =>
                                day.weekday >= 1 && day.weekday <= 5,
                            onDateChanged: (DateTime date) {
                              setState(
                                () {
                                  selectedDate = date;
                                  controller.dateSchedule = date;
                                  controller.dateScheduleString =
                                      DateFormat('dd/MM/yyyy').format(date);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Column(
                      children: [
                        const Text(
                          'Selecione o horário:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: SigmaColors.blue,
                            ),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(
                                color: SigmaColors.blue, fontSize: 18),
                            underline: Container(
                              height: 2,
                              color: SigmaColors.blue,
                            ),
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
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (chosenSpeciality != null) ...[
                    Text(
                      "Especialidade: ${speciality[chosenSpeciality!]}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                  const SizedBox(height: 4),
                  Text(
                    "Data: $formattedDate  Hora: $formattedTime",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      controller.addSchedule(
                        context,
                        controller.specialityDoctor!,
                        controller.patientId!,
                        controller.dateScheduleString,
                        controller.hourScheduleString,
                      );
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
