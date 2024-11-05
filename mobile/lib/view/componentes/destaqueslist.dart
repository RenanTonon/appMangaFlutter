import 'package:flutter/material.dart';
import 'package:mobile/controller/destaquescontroller.dart';
import 'package:mobile/style/colorts.dart';

class Destaqueslist extends StatefulWidget{
  const Destaqueslist({super.key});

  @override
  State<Destaqueslist> createState() => _DestaquesListState();
}

class _DestaquesListState extends State<Destaqueslist>{
  var mangas = DestaquesControler.showMangaGrid();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index){
      var item = mangas[index];
      return Padding(padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 120,
        height: 181,
        color: red1,
        child: Column(
          children: [
            Image.network(item.imagem)
          ],
        ),
      ),);
    });
  }
}