import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NoticePage extends StatefulWidget {
  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  Map<String, dynamic> dados;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("http://hardtec.ga/api/lista-post.php"),
        headers: {"Accept": "Application/json"});

    setState(() {
      dados = json.decode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text((dados['users'].length)),
    );
  }
}
