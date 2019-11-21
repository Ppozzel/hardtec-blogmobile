import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:share/share.dart';

class ItemCard extends StatelessWidget {
  final Map<String, dynamic> clicado;
  final int index;

  DateTime data;

  ItemCard(this.clicado, this.index);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          "${clicado['posts'][index]['titulo']}",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Monoton',
            fontSize: 24,
          ),
        ),
        backgroundColor: Color.fromRGBO(237, 134, 24, 0.9),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: new EdgeInsets.all(8),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                "http://hardtec.ga/assets/img/post/${clicado['posts'][index]['id_postagem']}/${clicado['posts'][index]['id_postagem'] + clicado['posts'][index]['imgtype']}" ??
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "${clicado['posts'][index]['titulo']}",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 30, 0),
                    child: Text(formatDate(
                        DateTime.parse(clicado['posts'][index]['data']), [
                      dd,
                      '/',
                      mm,
                      '/',
                      yyyy,
                    ])),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              HtmlWidget(
                clicado['posts'][index]['conteudo'],
              ),
              new RaisedButton(
                child: const Text('Compartilhar'),
                onPressed: () {
                  final RenderBox box = context.findRenderObject();
                  Share.share(
                      "http://hardtec.ga/post/${clicado['posts'][index]['slug']}",
                      sharePositionOrigin:
                          box.localToGlobal(Offset.zero) & box.size);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
