import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

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
          margin: new EdgeInsets.all(8),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                "${clicado['posts'][index]['imagem_destaque']}" ??
                    'https://upload.wikimedia.org//wikipedia//commons//1//17//Google-flutter-logo.png',
                width: 600,
                height: 170,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "${clicado['posts'][index]['titulo']}",
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Text(formatDate(
                    DateTime.parse(clicado['posts'][index]['data']), [
                  dd,
                  '/',
                  mm,
                  '/',
                  yyyy,
                ])),
              ),
              SizedBox(
                height: 20.0,
              ),
              HtmlWidget(
                clicado['posts'][index]['conteudo'],
              ),
              // Text(
              //   "${clicado['posts'][index]['conteudo']}",
              //   style: new TextStyle(
              //     fontFamily: 'Monoto',
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
