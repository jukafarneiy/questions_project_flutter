import 'package:flutter/material.dart';
import 'package:questions_project/resultado.dart';
import 'questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': "Qual sua cor favorita?",
      'respostas': ["Preto", "Verde", "Vermelho", "Branco"],
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Questions"),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder)
            : Resultado("Parabéns!!"),
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
