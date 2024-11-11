import 'package:flutter/material.dart';
import 'package:mobile/pages/adicionaMangaPageWidgets/formularioAdicionaMnaga.dart';
import 'package:mobile/pages/adicionaMangaPageWidgets/listaMangas.dart';
import 'package:mobile/pages/homePageWidgets/header.dart';

class AdicionamangaPage extends StatelessWidget{
  const AdicionamangaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text('MANGA QUEST'),
      centerTitle: true,
      backgroundColor: const Color(0xFF3D0205),
      automaticallyImplyLeading: false,
      
         ),
         body: Align(
          alignment: Alignment.center,
          child: Column(
          children: [ HeaderWidget(), Expanded(flex: 2, child: MangaFormPage()), Expanded( flex: 1, child: MangaListPage()) ],
         ) 
         )
    );
  }
  
}