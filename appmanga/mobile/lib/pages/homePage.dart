import 'package:flutter/material.dart';
import 'package:mobile/pages/homePageWidgets/banner.dart';
import 'package:mobile/pages/homePageWidgets/header.dart';
import 'package:mobile/pages/homePageWidgets/listaManga.dart';

class Homepage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text('MANGA QUEST'),
      centerTitle: true,
      backgroundColor: const Color(0xFF3D0205),//define a cor de fundo
      automaticallyImplyLeading: false,
         ),
         body: Align(
          alignment: Alignment.center,
          child: Column(
          children: [ HeaderWidget(),BannerWidget(), Text('Mangas Populares'),Expanded(child: MangaListView()) ],
         ) 
         )
      );
  }
}