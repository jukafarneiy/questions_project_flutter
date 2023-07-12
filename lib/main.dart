import 'package:flutter/material.dart';
import 'package:questions_project/resultado.dart';
import 'questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': "Qual sua cor favorita?",
      'respostas': [
        {'texto': "Preto", 'pontuacao': 10},
        {'texto': "Verde", 'pontuacao': 5},
        {'texto': "Vermelho", 'pontuacao': 3},
        {'texto': "Branco", 'pontuacao': 1},
      ],
    },
    {
      'texto': "Qual é o seu animal favorito?",
      'respostas': [
        {'texto': "Coelho", 'pontuacao': 10},
        {'texto': "Cobra", 'pontuacao': 5},
        {'texto': "Elefante", 'pontuacao': 2},
        {'texto': "Leão", 'pontuacao': 3},
      ],
    },
    {
      'texto': "Qual é a sua estação favorita?",
      'respostas': [
        {'texto': "Outono", 'pontuacao': 5},
        {'texto': "Verão", 'pontuacao': 4},
        {'texto': "Inverno", 'pontuacao': 1},
        {'texto': "Primavera", 'pontuacao': 7},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
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
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
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
