import 'package:flutter/material.dart';
import 'package:mobile/controller/destaquescontroller.dart';
import 'package:mobile/style/colorts.dart';
import 'package:mobile/models/destaquesmodel.dart';

class DestaquesList extends StatefulWidget {
  const DestaquesList({super.key});

  @override
  State<DestaquesList> createState() => _DestaquesListState();
}

class _DestaquesListState extends State<DestaquesList> {
  late Future<List<DestaquesModel>> mangas; 

  @override
  void initState() {
    super.initState();
    mangas = DestaquesControler.showMangaGrid(); 
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DestaquesModel>>(
      future: mangas,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator()); 
        } else if (snapshot.hasError) {
          return const Center(child: Text('Erro ao carregar mangas')); 
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Nenhum mangá disponível'));
        }

        
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            var item = snapshot.data![index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 120,
                height: 181,
                color: red1,
                child: Column(
                  children: [
                    Image.network(item.imagem),
                    Text(item.titulo, style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
