import 'package:flutter/material.dart';
import 'package:mobile/pages/adicionaMangaPageWidgets/formularioAdicionaMnaga.dart';
import 'package:mobile/pages/homePageWidgets/header.dart';

class AdicionamangaPage extends StatelessWidget{
  const AdicionamangaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text('MANGA QUEST'),
      centerTitle: true,
      backgroundColor: const Color(0xFF3D0205),//define a cor de fundo
      
         ),
         body: Align(
          alignment: Alignment.center,
          child: Column(
          children: [ HeaderWidget(), Expanded(child: MangaFormPage()) ],
         ) 
         )
    );
  }
  
}