import 'package:flutter/material.dart';
import 'package:mobile/pages/adicionaMangaPage.dart';
import 'package:mobile/pages/homePage.dart';
import 'package:mobile/pages/pesquisaMangasPage.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            child: ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Pesquisamangaspage()),
            );
          }, 
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3D0205),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(10.0),
            
          ) ,
          child: const Icon(Icons.search)),
          ),
          
          Container(
            margin: const EdgeInsets.all(10.0),
            child: ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            );
          }, 
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3D0205),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(10.0),
            
          ) ,
          child: const Icon(Icons.home)),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AdicionamangaPage()),
            );
          }, 
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3D0205),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(10.0),
            
          ) ,
          child: const Icon(Icons.people)),
          ),
        ],
      ),
    );
  }
}
