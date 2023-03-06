import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  // const Questionario({super.key});

  final String questaoText;
  final List<Map<String, Object>> respostas;
  final void Function(int) func;

  const Questionario(
      {required this.questaoText,
      required this.respostas,
      required this.func,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Questao(questaoText),
        ...respostas.map((resp) {
          return Resposta(resp['texto'].toString(),
              () => func(int.parse(resp['nota'].toString())));
        }).toList(),
      ],
    );
  }
}
