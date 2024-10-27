import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sigma/screens/home_screen.dart';
import 'package:sigma/screens/widgets/box_news_widget.dart';

void main(){
  testWidgets('Verifique se o título está presente no AppBar', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    expect(find.widgetWithText(AppBar, 'Notícias da Saúde'), findsOneWidget);

    expect(find.byType(AppBar), findsOneWidget);
  });
  
  testWidgets('HomeScreen exibe itens de notícias', (WidgetTester tester) async {
    // Build the HomeScreen widget
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    // Verify that the first news item is present
    expect(find.text('São Caetano aprova criação do Hospital Universitário da USCS'), findsOneWidget);
    expect(find.text('A Câmara de São Caetano aprovou, em sessão extraordinária realizada na noite desta quinta-feira (17/06), o projeto de lei que autoriza a Prefeitura a firmar convênio com a USCS (Universidade Municipal de São Caetano do Sul) para a criação do Hospital Universitário da USCS.'), findsOneWidget);

    // Verify that the second news item is present
    expect(find.text('Desafios na Saúde de São Caetano: Médicos Aumentam a Pressão para Reduzir tempo de atendimento'), findsOneWidget);
  });

  testWidgets('HomeScreen exibe BoxNewsWidget, um widget de item de notícias', (WidgetTester tester) async {
    // Build the HomeScreen widget
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    // Verify that there are BoxNewsWidget instances present
    expect(find.byType(BoxNewsWidget), findsNWidgets(5)); // Ajuste o número conforme o esperado
  });
  
}