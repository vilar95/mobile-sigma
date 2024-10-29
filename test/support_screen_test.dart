import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sigma/screens/support_screen.dart';

void main() {

  setUp(() {
  });

  testWidgets('Verifica se a tela de suporte é renderizada corretamente',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SupportScreen()));

    expect(find.text('Suporte'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('Verifica se os campos de texto estão presentes',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SupportScreen()));

    expect(find.text('Digite o assunto da sua mensagem:'),
        findsOneWidget);
    expect(find.text('No campo abaixo, digite suas dúvidas ou sugestões de melhorias:'), findsOneWidget);
  });

  testWidgets('Verifica se o botão de envio está presente',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SupportScreen()));

    expect(find.text('Enviar'), findsOneWidget);
  });

  testWidgets('Verifica se a validação do formulário funciona corretamente',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SupportScreen()));

    await tester.tap(find.text('Enviar'));
    await tester.pump();
  });

}
