import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sigma/screens/schedule_screen.dart';
import 'package:sigma/screens/widgets/drawer_widget.dart';

void main() {
  // Configuração inicial
  setUp(() {
    // Qualquer configuração necessária antes de cada teste
  });

  // Teste: Verifica se o Drawer é renderizado corretamente
  testWidgets('Verifica se o Drawer é renderizado corretamente',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        drawer: const DrawerWidget(),
        body: Builder(
          builder: (context) => Center(
            child: ElevatedButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              child: const Icon(Icons.menu),
            ),
          ),
        ),
      ),
    ));

    // Abre o Drawer
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    expect(find.byType(Drawer), findsOneWidget);
  });

  // Teste: Verifica se os itens do Drawer estão presentes
  testWidgets('Verifica se os itens do Drawer estão presentes',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        drawer: const DrawerWidget(),
        body: Builder(
          builder: (context) => Center(
            child: ElevatedButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              child: const Icon(Icons.menu),
            ),
          ),
        ),
      ),
    ));

    // Abre o Drawer
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    expect(find.text('Página Inicial'), findsOneWidget);
    expect(find.text('Agendar Consulta'), findsOneWidget);
    expect(find.text('Meus Agendamentos'), findsOneWidget);
    expect(find.text('Suporte'), findsOneWidget);
    expect(find.text('Sair'), findsOneWidget);
  });

  // Teste: Verifica se a navegação funciona corretamente ao clicar em um item do Drawer
  testWidgets(
      'Verifica se a navegação funciona corretamente ao clicar em um item do Drawer',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        drawer: const DrawerWidget(),
        body: Builder(
          builder: (context) => Center(
            child: ElevatedButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              child: const Icon(Icons.menu),
            ),
          ),
        ),
      ),
      routes: {
        '/schedule': (context) => const ScheduleScreen(),
      },
    ));

    // Abre o Drawer
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    // Clica no item "Agendar Consulta"
    await tester.tap(find.text('Agendar Consulta'));
    await tester.pumpAndSettle();

    // Verifica se a navegação ocorreu corretamente
    expect(find.text('Agendar Consulta'), findsNWidgets(2));
  });
}
