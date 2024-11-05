import 'package:mobile/models/destaquesmodel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DestaquesControler {
  
  static Future<List<DestaquesModel>> showMangaGrid() async {
    List mangas = await fetchMangas();
    List<DestaquesModel> bookMangas = []; 

    
    for (var manga in mangas) {
      bookMangas.add(
        DestaquesModel(titulo: manga['titulo'], imagem: manga['foto'])
      );
    }

    return bookMangas;
  }

  
  static Future<List> fetchMangas() async {
    final url = Uri.parse('http://localhost:3000/mangas');
  
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List mangas = json.decode(response.body);
        print("Lista de mangas: ");
        return mangas;
      } else {
        print('Erro na requisição: ${response.statusCode}');
        return []; 
      }
    } catch (e) {
      print('Erro: $e');
      return []; 
    }
  }
}
