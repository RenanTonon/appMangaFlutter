import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MangaSearchPage extends StatefulWidget {
  @override
  _MangaSearchPageState createState() => _MangaSearchPageState();
}

class _MangaSearchPageState extends State<MangaSearchPage> {
  
  final TextEditingController _searchController = TextEditingController();

  
  List<Map<String, dynamic>> _mangas = [];

  
  Future<void> _searchMangas() async {
    final query = _searchController.text.trim();
    if (query.isEmpty) {
      return;
    }

    
    final response = await http.get(Uri.parse('http://localhost:3000/mangas?nome_like=$query'));

    if (response.statusCode == 200) {
      setState(() {
        // Atualizar a lista de mangas com o resultado da pesquisa
        _mangas = List<Map<String, dynamic>>.from(json.decode(response.body));
      });
    } else {
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao buscar mangas')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar Manga'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
           
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Digite o nome do manga',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _searchMangas,
                ),
              ),
              onSubmitted: (_) => _searchMangas(),
            ),
            const SizedBox(height: 20),

            
            Expanded(
              child: _mangas.isEmpty
                  ? Center(child: Text('Nenhum manga encontrado'))
                  : ListView.builder(
                      itemCount: _mangas.length,
                      itemBuilder: (context, index) {
                        final manga = _mangas[index];
                        return ListTile(
                          leading: Image.network(
                            manga['foto'],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(manga['nome']),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
