import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/view/pages/homepage.dart'; 

void main() {

  testWidgets('Verificar se o campo de pesquisa está presente', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    expect(find.byType(CupertinoSearchTextField), findsOneWidget);
  });


  testWidgets('Verificar o placeholder do campo de pesquisa', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    expect(find.text('Procurar por mangá...'), findsOneWidget);
  });


  testWidgets('Verificar se o texto "Destaques do dia" está presente', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    expect(find.text('Destaques do dia'), findsOneWidget);
  });


  testWidgets('Verificar ícone de Home na barra de navegação', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    expect(find.byIcon(Icons.home), findsOneWidget);
  });

  testWidgets('Verificar ícone de List na barra de navegação', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    expect(find.byIcon(Icons.list), findsOneWidget);
  });

  testWidgets('Verificar ícone de Star na barra de navegação', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    expect(find.byIcon(Icons.star), findsOneWidget);
  });
}