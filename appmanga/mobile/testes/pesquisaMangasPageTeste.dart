import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/pages/pesquisaMangasPage.dart';// Caminho correto para a página
import 'package:mobile/pages/homePageWidgets/header.dart';
import 'package:mobile/pages/pesquisaMangasPageWidgets/searchManga.dart';

void main() {
  testWidgets('Pesquisamangaspage renders correctly', (WidgetTester tester) async {
    // Envolva o widget em um MaterialApp para fornecer contexto de navegação e temas
    await tester.pumpWidget(
      MaterialApp(
        home: Pesquisamangaspage(),
      ),
    );

    // Verificar se o título da AppBar está correto
    expect(find.text('MANGA QUEST'), findsOneWidget);

    // Verificar se o HeaderWidget é exibido
    expect(find.byType(HeaderWidget), findsOneWidget);

    // Verificar se o MangaSearchPage é exibido
    expect(find.byType(MangaSearchPage), findsOneWidget);

    // Verificar se a AppBar tem a cor correta
    final appBar = tester.widget<AppBar>(find.byType(AppBar));
    expect(appBar.backgroundColor, const Color(0xFF3D0205));
  });
}
