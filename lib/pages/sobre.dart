import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:http/http.dart' as http;

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

// Widget _AboutTeam() {
//   ListView listCategory = new ListView.builder(
//       itemCount: team == null ? 0 : team['categorias'].length,
//       scrollDirection: Axis.horizontal,
//       itemBuilder: (context, index) {
//         return _buildCategoryItem(index);
//       });

//   return new Container(
//     height: 55.0,
//     child: Container(
//       child: listCategory,
//     ),
//   );
// }

class _AboutState extends State<About> {
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
      body: new SingleChildScrollView(
        child: new Container(
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
              SizedBox(
                height: 20.0,
              ),
              HtmlWidget(
                clicado['posts'][index]['conteudo'],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
