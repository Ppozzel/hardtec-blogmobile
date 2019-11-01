import 'package:flutter/material.dart';

class NoticeHardTec extends StatefulWidget {
  @override
  _NoticeHardTecState createState() => _NoticeHardTecState();
}

class _NoticeHardTecState extends State<NoticeHardTec> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.9),
      appBar: AppBar(
        title: Text(
          "Um Titulo",
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


}
