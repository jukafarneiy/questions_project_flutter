import 'package:flutter/material.dart';
import 'perguntas.dart';
import 'respostas.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
  });

  bool get temPerguntaSelecionada => perguntaSelecionada < perguntas.length;

  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()["respostas"]
        : [];
    return Column(
      children: [
        Pergunta(perguntas[perguntaSelecionada]["texto"].toString()),
        ...respostas
            .map((resp) => Resposta(resp['texto'] as String,
                () => quandoResponder(int.parse(resp['pontuacao'].toString()))))
            .toList(),
      ],
    );
  }
}
