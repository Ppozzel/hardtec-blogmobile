import 'package:flutter/material.dart';

class sobreCurso extends StatefulWidget {
  @override
  _sobreCursoState createState() => _sobreCursoState();
}

class _sobreCursoState extends State<sobreCurso> {
  String sobrecurso =
      "O Assistente de Desenvolvimento de Aplicativos Computacionais é o profissional responsável por prestar assistência no desenvolvimento realizando a manutenção de software em um sistema mainframe ou desenvolve software para uso em computadores."
      "Um Assistente de Desenvolvimento de Sistemas Computacionais desenvolve sistemas e aplicações, determinando interface gráfica, critérios ergonômicos de navegação, montagem da estrutura de banco de dados e codificação de programas."
      "Está sob as responsabilidades de um Assistente de Desenvolvimento de Sistemas Computacionais planejar etapas e ações de trabalho, projetar, implantar e realizar manutenção de sistemas e aplicações, selecionar recursos de trabalho, tais como metodologias de desenvolvimento de sistemas, linguagem de programação e ferramentas de desenvolvimento, aplicar revisão de planos de sistemas, planejando etapas e ações de trabalho."
      "Para que o profissional tenha um bom desempenho como Assistente de Desenvolvimento de Sistemas Computacionais além da graduação é essencial sempre se manter atualizado em estudo, pesquisa e desenvolvimento tecnológico, pois a informática e a tecnologia da informação têm evoluído de uma forma vertiginosa nos últimos anos.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Curso"),
        backgroundColor: Color.fromRGBO(237, 134, 24, 0.9),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: Text(
              sobrecurso,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
      ),
    );
  }
}
