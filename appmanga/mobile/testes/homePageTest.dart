import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/pages/homePageWidgets/banner.dart';
import 'package:mobile/pages/homePageWidgets/header.dart';
import 'package:mobile/pages/homePageWidgets/listaManga.dart';
import 'package:mobile/pages/homepage.dart';

void main() {
  testWidgets('Homepage renders correctly', (WidgetTester tester) async {
    
    await tester.pumpWidget(
      MaterialApp(
        home: Homepage(),
      ),
    );

    
    expect(find.text('MANGA QUEST'), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);

    
    expect(find.text('Mangas Populares'), findsOneWidget);

   
    expect(find.byType(HeaderWidget), findsOneWidget);
    expect(find.byType(BannerWidget), findsOneWidget);
    expect(find.byType(MangaListView), findsOneWidget);
  });
}
