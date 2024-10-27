import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sigma/screens/schedule_screen.dart';

void main() {

  testWidgets('Verifica se o título está presente', (WidgetTester tester) async {
    // Constrói o widget ScheduleScreen e dispara um frame.
    await tester.pumpWidget(const MaterialApp(home: ScheduleScreen()));

    // Verifica se o título "Selecione a Especialidade:" está presente.
    expect(find.text('Selecione a Especialidade:'), findsOneWidget);
   
    // Verifica se o título "Selecione a data:" está presente.
    expect(find.text('Selecione a data:'), findsOneWidget);

    // Verifica se o título "Selecione o horário:" está presente.
    expect(find.text('Selecione o horário:'), findsOneWidget);

  });
    testWidgets('Verifica se o CalendarDatePicker está presente', (WidgetTester tester) async {
    // Constrói o widget ScheduleScreen e dispara um frame.
    await tester.pumpWidget(const MaterialApp(home: ScheduleScreen()));

    // Verifica se o CalendarDatePicker está presente.
    expect(find.byType(CalendarDatePicker), findsOneWidget);
  });
  testWidgets('Verifica se o DropdownButton de especialidades e horários estão presentes', (WidgetTester tester) async {
    // Constrói o widget ScheduleScreen e dispara um frame.
    await tester.pumpWidget(const MaterialApp(home: ScheduleScreen()));

    // Verifica se o DropdownButton de especialidades e horários estão presentes.
    expect(find.byType(DropdownButton<String>), findsNWidgets(2));
  });
  
   testWidgets('Verifica se o titulo da screen e botão de agendamento estão presentes', (WidgetTester tester) async {
    // Constrói o widget ScheduleScreen e dispara um frame.
    await tester.pumpWidget(const MaterialApp(home: ScheduleScreen()));
    await tester.pump();

    // Verifica se o título "Agendar Consulta" e o botão estão presentes.
    expect(find.text('Agendar Consulta'), findsNWidgets(2));
  });
}