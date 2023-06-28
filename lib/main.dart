import 'package:flutter/material.dart';
import 'perguntas.dart';
import 'respostas.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': "Qual é sua cor favorita?",
      'respostas': ["Preto", "Vermelho", "Verde", "Branco"],
    },
    {
      'texto': "Qual é o seu animal favorito?",
      'respostas': ["Coelho", "Cobra", "Elefante", "Leão"],
    },
    {
      'texto': "Qual é a sua estação favorita?",
      'respostas': ["Outono", "Verão", "Inverno", "Primavera"],
    }
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada => _perguntaSelecionada < _perguntas.length;

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada].cast()["respostas"]
        : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Questions"),
        ),
        body: temPerguntaSelecionada
            ? Column(
                children: [
                  Pergunta(
                      _perguntas[_perguntaSelecionada]["texto"].toString()),
                  ...respostas.map((t) => Resposta(t, _responder)).toList(),
                ],
              )
            : Center(
                child: Text(
                  "Parabéns!",
                  style: TextStyle(fontSize: 28),
                ),
              ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
