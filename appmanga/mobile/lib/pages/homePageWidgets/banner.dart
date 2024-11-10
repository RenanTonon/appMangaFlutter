import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
          width: 2000,
          height: 200,
          alignment: Alignment.center,
          padding:const EdgeInsets.all(16.0),
          margin: const EdgeInsets.all(10.0),
          child: Image.network("https://br.web.img3.acsta.net/img/cb/60/cb60df8069cfc9478926ad1fde3f5060.jpg"),
          
         );
  }
}