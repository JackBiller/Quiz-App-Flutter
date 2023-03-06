import 'package:flutter/material.dart';
// import './questao.dart';
// import './resposta.dart';
import './resultado.dart';
import './questionario.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _indexPergunta = 0;
	var _totPontos = 0;

  void _responder(int nota) {
    setState(() {
      _indexPergunta++;
			_totPontos += nota;
    });
    print('Pergunta respondida! $_totPontos');
  }

	void _reiniciar() {
		setState(() {
      _indexPergunta = 0;
			_totPontos = 0;
		});
	}

  final perguntas = [
    {
      'pergunta': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Azul', 'nota': 10},
        {'texto': 'Verde', 'nota': 05},
        {'texto': 'Rosa', 'nota': 03},
        {'texto': 'Preto', 'nota': 01},
      ],
    },
    {
      'pergunta': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Papagaio', 'nota': 05},
        {'texto': 'Cabra', 'nota': 10},
        {'texto': 'Jacaré', 'nota': 03},
        {'texto': 'Águia', 'nota': 01},
      ],
    },
    {
      'pergunta': 'Qual sua linguagem favorita?',
      'respostas': [
        {'texto':'JavaScript', 'nota': 03},
        {'texto':'C++', 'nota': 01},
        {'texto':'Flutter', 'nota': 10},
        {'texto':'Dart', 'nota': 05},
      ],
    }
  ];

  bool get temPerguntaSelecionada {
    return _indexPergunta < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = perguntas[_indexPergunta % perguntas.length]
        ['respostas'] as List<Map<String, Object>>;
    String questaoText =
        perguntas[_indexPergunta % perguntas.length]['pergunta'].toString();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                questaoText: questaoText,
                respostas: respostas,
                func: _responder)
            : Resultado(
							pontos: _totPontos,
							func: _reiniciar,
						),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
