import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MangaListPage extends StatefulWidget {
  const MangaListPage({super.key});

  @override
  _MangaListPageState createState() => _MangaListPageState();
}

class _MangaListPageState extends State<MangaListPage> {
  List<Map<String, dynamic>> _mangas = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchMangas();
  }

  // Função para buscar mangas da API
  Future<void> _fetchMangas() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:3000/mangas'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        setState(() {
          // Filtra os mangas com id que são strings
          _mangas = data
              .where((manga) => manga['id'] is String)  // Verifica se o id é do tipo String
              .map((manga) => manga as Map<String, dynamic>)
              .toList();
          _isLoading = false;
        });
      } else {
        throw Exception('Falha ao carregar mangas');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao carregar mangas: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Mangás'),
        automaticallyImplyLeading: false,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _mangas.length,
              itemBuilder: (context, index) {
                final manga = _mangas[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.network(
                      manga['foto'],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(manga['nome']),
                    subtitle: Text('ID: ${manga['id']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            _editManga(manga);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            _confirmDeleteManga(manga);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  // Função para editar manga (simulação)
  void _editManga(Map<String, dynamic> manga) {
    TextEditingController _nomeController = TextEditingController(text: manga['nome']);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar Manga'),
          content: TextField(
            controller: _nomeController,
            decoration: const InputDecoration(labelText: 'Nome do Manga'),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                // Atualiza o manga no banco de dados
                await _updateManga(manga['id'], _nomeController.text);
                setState(() {
                  manga['nome'] = _nomeController.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Salvar'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  // Função para confirmar a exclusão do manga
  void _confirmDeleteManga(Map<String, dynamic> manga) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar exclusão'),
          content: Text('Você tem certeza que deseja excluir o manga "${manga['nome']}"?'),
          actions: [
            TextButton(
              onPressed: () async {
                // Exclui o manga no banco de dados
                await _deleteManga(manga['id']);
                setState(() {
                  _mangas.remove(manga);
                });
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${manga['nome']} excluído')),
                );
              },
              child: const Text('Excluir'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  // Função para editar manga no banco de dados
  Future<void> _updateManga(String id, String nome) async {
    try {
      final response = await http.put(
        Uri.parse('http://localhost:3000/mangas/$id'),
        body: json.encode({
          'nome': nome,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode != 200) {
        throw Exception('Falha ao atualizar manga');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao editar manga: $e')),
      );
    }
  }

  // Função para excluir manga no banco de dados
  Future<void> _deleteManga(String id) async {
    try {
      final response = await http.delete(
        Uri.parse('http://localhost:3000/mangas/$id'),
      );

      if (response.statusCode != 200) {
        throw Exception('Falha ao excluir manga');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao excluir manga: $e')),
      );
    }
  }
}
