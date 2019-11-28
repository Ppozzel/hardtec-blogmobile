import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  Map<String, dynamic> aluno;
  var isLoading = false;

  getData() async {
    setState(() {
      isLoading = true;
    });

    var response = await http.get(
        Uri.encodeFull("http://hardtec.ga/api/lista-post.php"),
        headers: {"Accept": "Application/json"});
    if (response.statusCode == 200) {
      this.setState(() {
        aluno = json.decode(response.body);
        //print(dados);
        isLoading = false;
      });
    }
  }

  String sobrecurso33 =
      "O Assistente de Desenvolvimento de Aplicativos Computacionais é o profissional responsável por prestar assistência no desenvolvimento realizando a manutenção de software em um sistema mainframe ou desenvolve software para uso em computadores."
      "Um Assistente de Desenvolvimento de Sistemas Computacionais desenvolve sistemas e aplicações, determinando interface gráfica, critérios ergonômicos de navegação, montagem da estrutura de banco de dados e codificação de programas."
      "Está sob as responsabilidades de um Assistente de Desenvolvimento de Sistemas Computacionais planejar etapas e ações de trabalho, projetar, implantar e realizar manutenção de sistemas e aplicações, selecionar recursos de trabalho, tais como metodologias de desenvolvimento de sistemas, linguagem de programação e ferramentas de desenvolvimento, aplicar revisão de planos de sistemas, planejando etapas e ações de trabalho."
      "Para que o profissional tenha um bom desempenho como Assistente de Desenvolvimento de Sistemas Computacionais além da graduação é essencial sempre se manter atualizado em estudo, pesquisa e desenvolvimento tecnológico, pois a informática e a tecnologia da informação têm evoluído de uma forma vertiginosa nos últimos anos.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.9),
      appBar: new AppBar(
        title: Text("Team Work ᕕ( ᐛ )ᕗ",
            style: TextStyle(fontFamily: 'Monoton', color: Colors.white)),
        backgroundColor: Color.fromRGBO(237, 134, 24, 0.9),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: aluno == null ? 0 : aluno['alunos'].length,
            itemBuilder: (BuildContext context, int index) {
              print(aluno['alunos'].length);
              return Card(
                child: new Container(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: SizedBox(
                          width: 340,
                          height: 200,
                          child: CachedNetworkImage(
                            imageUrl: "${aluno['alunos'][index]['img_aluno']}" ??
                                'https://upload.wikimedia.org//wikipedia//commons//1//17//Google-flutter-logo.png',
                            placeholder: (context, url) =>
                                new CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                new Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: new Text(
                                      "${aluno['alunos'][index]['nome']}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Roboto',
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: new Text(
                                            "${aluno['alunos'][index]['skills']}",
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: new Text(
                                            "${aluno['alunos'][index]['participacao']}",
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            aluno['alunos'][index]['instagram'] !=
                                                    ''
                                                ? new Image.asset(
                                                    'assets/img/instagram.png',
                                                    width: 40,
                                                    height: 50,
                                                  )
                                                : new Container(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  // str.contains('Instagram') ? null :
                                                  "${aluno['alunos'][index]['instagram']}"),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            aluno['alunos'][index]['linkedin'] !=
                                                    ''
                                                ? new Image.asset(
                                                    'assets/img/linkedin.png',
                                                    width: 40,
                                                    height: 50,
                                                  )
                                                : new Container(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  // str.contains('Instagram') ? null :
                                                  "${aluno['alunos'][index]['linkedin']}"),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            aluno['alunos'][index]['github'] !=
                                                    ''
                                                ? new Image.asset(
                                                    'assets/img/github.png',
                                                    width: 40,
                                                    height: 50,
                                                  )
                                                : new Container(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  // str.contains('Instagram') ? null :
                                                  "${aluno['alunos'][index]['github']}"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }
}
