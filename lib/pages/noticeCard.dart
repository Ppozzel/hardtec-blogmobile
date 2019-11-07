import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';

class ItemCard extends StatelessWidget {
  final Map<String, dynamic> clicado;
  final int index;

  DateTime data;

  // final dt = new DateFormat('yyyy-MM-dd hh:mm a');

  ItemCard(this.clicado, this.index);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("${clicado['posts'][index]['titulo']}"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: new EdgeInsets.all(15.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                "${clicado['posts'][index]['imagem_destaque']}" ?? 'https://upload.wikimedia.org//wikipedia//commons//1//17//Google-flutter-logo.png',
                width: 600,
                height: 170,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 6.0,),
              Column(
                children: <Widget>[
                  Text(
                    "${clicado['posts'][index]['titulo']}",
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontFamily: 'PressStart2P',
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(formatDate(DateTime.parse(clicado['posts'][index]['data']), [
                dd,
                '/',
                mm,
                '/',
                yyyy,
              ])),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "${clicado['posts'][index]['conteudo']}",
                style: new TextStyle(
                  fontFamily: 'PressStart2P',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
