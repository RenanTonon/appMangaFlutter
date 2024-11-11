import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MangaFormPage extends StatefulWidget {
  @override
  _MangaFormPageState createState() => _MangaFormPageState();
}

class _MangaFormPageState extends State<MangaFormPage> {
  
  final _formKey = GlobalKey<FormState>();

 
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _photoUrlController = TextEditingController();

 
  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      final name = _nameController.text;
      final photoUrl = _photoUrlController.text;

      // Enviar os dados para o servidor
      final response = await http.post(
        Uri.parse('http://localhost:3000/mangas'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          'nome': name,
          'foto': photoUrl,
        }),
      );

      if (response.statusCode == 201) {
      
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Manga adicionado com sucesso!')));
      } else {
        
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro ao adicionar manga')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Manga'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nome do Manga',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do manga';
                  }
                  return null; 
                },
              ),
              const SizedBox(height: 20),

              
              TextFormField(
                controller: _photoUrlController,
                decoration: const InputDecoration(
                  labelText: 'URL da Foto',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a URL da foto';
                  }
                  
                  if (!Uri.parse(value).isAbsolute) {
                    return 'Por favor, insira uma URL válida';
                  }
                  return null; 
                },
              ),
              const SizedBox(height: 20),

           
              ElevatedButton(
                onPressed: _submitForm, // Chama a função para enviar os dados
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
