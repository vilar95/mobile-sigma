import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sigma/screens/auth_screen.dart';

void main() {
  testWidgets('Verifica se a tela de AuthScreen renderiza corretamente',
      (WidgetTester tester) async {
    // Construa o widget AuthScreen
    await tester.pumpWidget(const MaterialApp(home: AuthScreen()));

    // Verifica se a Image está presente
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(Image), findsNWidgets(1));

    // Verifique se o título e os elementos do formulário estão presentes
    expect(find.text('E-mail'), findsOneWidget);
    expect(find.text('Senha'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));

    // Verifique se os botões de alternância estão presentes
    expect(find.text('E-mail'), findsOneWidget);
    expect(find.text('Senha'), findsOneWidget);
    expect(find.text('Entrar'), findsOneWidget);
    expect(find.text('Bem vindo(a) ao'), findsOneWidget);
    expect(find.text('Sistema Integrado de Gestão Médica e Atendimento'),
        findsOneWidget);
    expect(find.text('Esqueci minha senha'), findsOneWidget);
    expect(find.text('Não tem conta? Clique aqui para cadastrar.'),
        findsOneWidget);
    expect(find.byType(Text), findsNWidgets(7));
  });

  testWidgets(
      'Verifica se a validação do login mostra erros quando os campos estão vazios',
      (WidgetTester tester) async {
    // Construa o widget AuthScreen
    await tester.pumpWidget(const MaterialApp(home: AuthScreen()));
    await tester.pumpAndSettle();

    // Toque no botão para acionar a validação
     await tester.tap(find.byKey(const Key('button')));
    await tester.pumpAndSettle();

    // Verifique se as mensagens de validação são exibidas
    expect(find.text('Insira um e-mail válido.'), findsOneWidget);
    expect(find.text('Insira a senha.'), findsOneWidget);
  });
  
  testWidgets('Alterna entre login e cadastro', (WidgetTester tester) async {
    // Construa o widget AuthScreen
    await tester.pumpWidget(const MaterialApp(home: AuthScreen()));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Não tem conta? Clique aqui para cadastrar.'));
    await tester.pumpAndSettle();

    // Verifique se o titulo de cadastro esta presente
    expect(find.byKey(const Key('AuthTitle')), findsOneWidget);
  });

  testWidgets('O diálogo de esquecimento de senha aparece quando clicado',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: AuthScreen()));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Esqueci minha senha'));
    await tester.pump();

    expect(find.text('Confirme o e-mail para redefinição de senha'),
        findsOneWidget);
  });
}
