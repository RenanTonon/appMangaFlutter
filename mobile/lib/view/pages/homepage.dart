import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/style/colorts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override 
  State<HomePage> createState()=>_HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const CupertinoSearchTextField(
          itemColor: Colors.white70,
          placeholder: 'Procurar por mangá...',
          style: TextStyle(color: Colors.white38),
          placeholderStyle: TextStyle(fontSize: 15, color: Colors.white30),
          padding: EdgeInsets.all(12),
        ),
      ),
      body: const Column(
        children: [
          Padding(padding: EdgeInsets.all(8.0),
          child: Text('Destaques do dia', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),),)
        ],
        
      ),
      backgroundColor: primarygrey,
      bottomNavigationBar: NavigationBar(destinations: [
        Icon(Icons.home),
        Icon(Icons.list,color: Colors.grey,),
        Icon(Icons.star, color: Colors.grey,)
      ]),
    );
  }
}