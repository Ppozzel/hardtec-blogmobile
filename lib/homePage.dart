import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hardtec_app/pages/noticeCard.dart';
import 'package:http/http.dart' as http;
import 'package:hardtec_app/pages/slider.dart';
import 'package:date_format/date_format.dart';

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
        print(dados);
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
          "Assuntos Principais",
          style: TextStyle(fontFamily: 'Monoton', color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.9),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(),
            _createDrawerItem(
              icon: Icons.contacts,
              text: 'Contato',
            ),
            _createDrawerItem(
              icon: Icons.face,
              text: 'Equipe',
            ),
            _createDrawerItem(
              icon: Icons.account_box,
              text: 'Flutter Documentation GitHub',
            ),
            _createDrawerItem(
              icon: Icons.info_outline,
              text: 'Porque este App',
            ),
            Divider(),
            _createDrawerItem(
              icon: Icons.bug_report,
              text: 'Report um BUG',
            ),
            SizedBox(height: 100),
            ListTile(
              title: Text('0.0.1'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: dados == null ? 0 : dados['posts'].length,
              itemBuilder: (BuildContext context, int index) {
                print("${dados['posts'][index]['titulo']}");
                return new GestureDetector(
                  child: Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 150.0,
                          height: 150.0,
                          child: CachedNetworkImage(
                            imageUrl:
                              "${dados['posts'][index]['imagem_destaque']}" ?? 'https://upload.wikimedia.org//wikipedia//commons//1//17//Google-flutter-logo.png',
                            placeholder: (context, url) =>
                                new CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                new Icon(Icons.error),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "${dados['posts'][index]['titulo']}",
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontFamily: 'Roboto',
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(formatDate(
                                    DateTime.parse(
                                        dados['posts'][index]['data']),
                                    [dd, '/', mm, '/', yyyy])),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Text(
                                    "${dados['posts'][index]['conteudo']}",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style: new TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ItemCard(dados, index)));
                  },
                );
              },
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

  //============começo do menu categoria=============//
  void setCategorys() {
    _categorys.add("Todos");
    _categorys.add("Limpeza de Componentes");
    _categorys.add("Manutenção de Desktops");
    _categorys.add("Saúde e Bem Estar de sua Maquina");
    _categorys.add("Quiz");
    _categorys.add("Fica Dica =D");
  }

  Widget _getListCategory() {
    ListView listCategory = new ListView.builder(
        itemCount: _categorys.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _buildCategoryItem(index);
        });

    return new Container(
      height: 55.0,
      child: listCategory,
    );
  }

  Widget _buildCategoryItem(index) {
    return new GestureDetector(
      onTap: () {
        onTabCategory(index);
      },
      child: new Center(
        child: new Container(
          margin: new EdgeInsets.only(left: 10.0),
          child: new ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: new Container(
              padding: new EdgeInsets.only(
                  left: 12.0, top: 7.0, bottom: 7.0, right: 12.0),
              color: _category_selected == index
                  ? Colors.blue[800]
                  : Colors.blue[500],
              child: new Text(
                _categorys[index],
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
    });
  }

  //============fim do menu categoria=============//

  @override
  void initState() {
    super.initState();
    this.getData();
    setCategorys();
    NoticeHardTec();
  }
}
