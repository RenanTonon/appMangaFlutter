
import 'package:flutter/material.dart';
import 'package:mobile/pages/homePage.dart';

void main(){
  runApp(const Myapp());
}

class Myapp extends StatelessWidget{
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Mangas',
      theme: ThemeData.dark(),
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
  
}
