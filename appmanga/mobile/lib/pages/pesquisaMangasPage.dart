


import 'package:flutter/material.dart';
import 'package:mobile/pages/homePageWidgets/header.dart';
import 'package:mobile/pages/pesquisaMangasPageWidgets/searchManga.dart';

class Pesquisamangaspage extends StatelessWidget{
  const Pesquisamangaspage({super.key});

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
          children: [ HeaderWidget(), Expanded(child: MangaSearchPage())],
         ) 
         )
      );
  }

}