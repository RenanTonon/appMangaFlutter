import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MangaListView extends StatefulWidget {
  @override
  _MangaListViewState createState() => _MangaListViewState();
}

class _MangaListViewState extends State<MangaListView> {
  // Lista de itens para armazenar os dados do JSON
  List<Map<String, dynamic>> imageItems = [];

  // Função para buscar dados do JSON Server
  Future<void> fetchImages() async {
    final response = await http.get(Uri.parse('http://localhost:3000/mangas'));

    if (response.statusCode == 200) {
      setState(() {
        imageItems = List<Map<String, dynamic>>.from(json.decode(response.body));
      });
    } else {
      throw Exception('Falha ao carregar imagens');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchImages(); // Chamar a função para buscar as imagens ao inicializar o widget
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, 
        crossAxisSpacing: 8.0, 
        mainAxisSpacing: 8.0, 
        childAspectRatio: 100 / 300,
      ),
      itemCount: imageItems.length,
      itemBuilder: (context, index) {
        final item = imageItems[index];
        return Column(
          children: [
            
            Image.network(
              item['foto'],
              width: 150,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8), 
            Text(
              item['nome'],
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
