import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontos;
  final void Function() func;

  const Resultado({
    required this.pontos,
    required this.func,
    super.key,
  });

  String get textPont {
    if (pontos < 8) {
      return 'Nível 1';
    } else if (pontos < 12) {
      return 'Nível 2';
    } else if (pontos < 16) {
      return 'Nível 3';
    } else {
      return 'Nível 4';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(textPont, style: const TextStyle(fontSize: 28)),
        ),
        TextButton(
          onPressed: func,
          child: const Text(
            'Reiniciar?',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
