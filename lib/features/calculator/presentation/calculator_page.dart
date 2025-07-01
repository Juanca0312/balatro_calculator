import 'package:balatro_calculator/features/calculator/presentation/deck_section.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Balatro Game"),
            Row(children: [Text("Desafio"), Text("Nivel jugadas")]),
            Row(children: [Text("Jokers"), Text("Consumibles")]),
            DeckSection(),
            Text("Calcular fichas de jugada"),
          ],
        ),
      ),
    );
  }
}
