import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hardtec_app/pages/noticeCard.dart';
import 'package:hardtec_app/pages/sobre.dart';
import 'package:http/http.dart' as http;
import 'package:hardtec_app/pages/slider.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:html/parser.dart' show parse;

class NoticeHardTec extends StatefulWidget {
  @override
  _NoticeHardTecState createState() => _NoticeHardTecState();
}

class _NoticeHardTecState extends State<NoticeHardTec> {
  Map<String, dynamic> dados;
  var isLoading = false;

  List _categorys = new List();
  var _category_selected = 0;

  List _news = new List();
  var repository = new MyApp();
  var _currentIndex = 0;

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Olá"),
          content: new Text("Está é uma versão instavél de aplicativo, e ainda há chances de alteração"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  getCat(idCat) async {
    setState(() {
      isLoading = true;
    });

    var response = await http.get(
        Uri.encodeFull("http://hardtec.ga/api/lista-post.php?id_cat=${idCat}"),
        headers: {"Accept": "Application/json"});
    if (response.statusCode == 200) {
      this.setState(() {
        dados = json.decode(response.body);
        //print(dados);
        isLoading = false;
      });
    }
  }

  static String removeTag(htmlString) {
    var codHtml = parse(htmlString);
    String htmlnoTag = parse(codHtml.body.text).documentElement.text;
    return htmlnoTag;
  }

  getData() async {
    setState(() {
      isLoading = true;
    });

    var response = await http.get(
        Uri.encodeFull("http://hardtec.ga/api/lista-post.php"),
        headers: {"Accept": "Application/json"});
    if (response.statusCode == 200) {
      this.setState(() {
        dados = json.decode(response.body);
        //print(dados);
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.9),
      appBar: new AppBar(
        title: Text(
          "Noticias",
          style: TextStyle(fontFamily: 'Monoton', color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(237, 134, 24, 0.9),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(),
            SizedBox(height: 20),
            ListTile(
              title: Text('Sobre o Time'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => About()),
                );
              },
            ),
            SizedBox(height: 360),
            ListTile(
              title: Text('0.1.254'),
              onTap: () {
                _showDialog();
              },
            ),
          ],
        ),
      ),
      body: new Container(
        margin: new EdgeInsets.all(8),
        child: new Column(
          children: <Widget>[
            _getListCategory(),
            new Expanded(
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : new RefreshIndicator(
                      child: ListView.builder(
                        itemCount: dados == null ? 0 : dados['posts'].length,
                        itemBuilder: (BuildContext context, int index) {
                          String test =
                              removeTag(dados['posts'][index]['conteudo']);
                          //print("${dados['posts'][index]['titulo']}");
                          return new GestureDetector(
                            child: Card(
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                    child: SizedBox(
                                      width: 340,
                                      height: 200,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "http://hardtec.ga/assets/img/post/${dados['posts'][index]['id_postagem']}/${dados['posts'][index]['id_postagem'] + dados['posts'][index]['imgtype']}" ??
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
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 0, 0, 0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 10),
                                                child: Text(
                                                  "${dados['posts'][index]['titulo']}",
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 0, 10, 9),
                                                    child: Text(formatDate(
                                                        DateTime.parse(
                                                            dados['posts']
                                                                    [index]
                                                                ['data']),
                                                        [
                                                          dd,
                                                          '/',
                                                          mm,
                                                          '/',
                                                          yyyy
                                                        ])),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5.0,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                child: Text(
                                                  test,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 3,
                                                  style: new TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(8, 20, 20, 4),
                                                    child: FlatButton(
                                                      child: Text(
                                                        "Leia Mais",
                                                        style: TextStyle(
                                                          color:
                                                              Colors.redAccent,
                                                          fontFamily: 'Roboto',
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    ItemCard(
                                                                        dados,
                                                                        index)));
                                                      },
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
                        },
                      ),
                      onRefresh: () async {
                        var response = await http.get(
                            Uri.encodeFull(
                                "http://hardtec.ga/api/lista-post.php"),
                            headers: {"Accept": "Application/json"});
                        if (response.statusCode == 200) {
                          this.setState(() {
                            dados = json.decode(response.body);
                            print(dados);
                            isLoading = false;
                          });
                        }
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('assets/img/drawer.jpg'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Seja Bem Vindo",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  Widget _getListCategory() {
    ListView listCategory = new ListView.builder(
        itemCount: dados == null ? 0 : dados['categorias'].length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _buildCategoryItem(index);
        });

    return new Container(
      height: 55.0,
      child: Container(
        child: listCategory,
      ),
    );
  }

  Widget _buildCategoryItem(index) {
    return new Center(
      child: new Container(
        margin: new EdgeInsets.only(left: 10.0),
        child: new ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: GestureDetector(
            onTap: () {
              print(dados['categorias'][index]['nome']);
              onTabCategory(index);

              dados['categorias'][index]['nome'] == ' TODAS'
                  ? getData()
                  : getCat(dados['categorias'][index]['id_categoria']);
            },
            child: new Container(
              padding: new EdgeInsets.only(
                  left: 12.0, top: 7.0, bottom: 7.0, right: 12.0),
              color: _category_selected == index
                  ? Colors.blue[800]
                  : Colors.blue[500],
              child: new Text(
                "${dados['categorias'][index]['nome']}",
                style: new TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Realiza chamada de serviço para atualizar as noticias de acordo com a categoria selecionada
  onTabCategory(index) {
    setState(() {
      _category_selected = index;
      // print(index);
    });
  }

  //============fim do menu categoria=============//

  @override
  void initState() {
    super.initState();
    NoticeHardTec();
    this.getData();
  }
}
