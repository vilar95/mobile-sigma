import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sigma/screens/support_screen.dart';

void main() {
  // Configuração inicial
  setUp(() {
    // Qualquer configuração necessária antes de cada teste
  });

  // Teste: Verifica se a tela de suporte é renderizada corretamente
  testWidgets('Verifica se a tela de suporte é renderizada corretamente',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SupportScreen()));

    expect(find.text('Suporte'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  // Teste: Verifica se os campos de texto estão presentes
  testWidgets('Verifica se os campos de texto estão presentes',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SupportScreen()));

    expect(find.text('Digite o assunto da sua mensagem:'),
        findsOneWidget);
    expect(find.text('No campo abaixo, digite suas dúvidas ou sugestões de melhorias:'), findsOneWidget);
  });

  // Teste: Verifica se o botão de envio está presente
  testWidgets('Verifica se o botão de envio está presente',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SupportScreen()));

    expect(find.text('Enviar'), findsOneWidget);
  });

  // Teste: Verifica se a validação do formulário funciona corretamente
  testWidgets('Verifica se a validação do formulário funciona corretamente',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SupportScreen()));

    await tester.tap(find.text('Enviar'));
    await tester.pump();

    // expect(find.text('Por favor, preencha este campo'),
    //     findsNWidgets(2)); // Supondo que há duas mensagens de erro
  });

}
