import 'package:flutter/material.dart';
import 'package:hardtec_app/pages/slider.dart';

class NoticeHardTec extends StatefulWidget {
  @override
  _NoticeHardTecState createState() => _NoticeHardTecState();
}

class _NoticeHardTecState extends State<NoticeHardTec> {
  List _categorys = new List();
  var _category_selected = 0;

  List _news = new List();
  var repository = new MyApp();
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.9),
      appBar: new AppBar(
        title: Text(
          "Tópicos Principais",
          style: TextStyle(fontFamily: 'Monoton', color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.9),
        centerTitle: true,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            _getListCategory(),
            // new Expanded(
            //   child: _getListViewWidget(),
            // )
          ],
        ),
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
              icon: Icons.note,
              text: 'Notes Atualização',
            ),
            _createDrawerItem(
              icon: Icons.face,
              text: 'Autores',
            ),
            _createDrawerItem(
              icon: Icons.account_box,
              text: 'Flutter Documentation App',
            ),
            _createDrawerItem(
              icon: Icons.info_outline,
              text: 'Sobre o App',
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
    );
  }

  @override
  void initState() {
    setCategorys();
    NoticeHardTec();
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
}
