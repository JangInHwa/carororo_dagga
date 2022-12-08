import 'package:carororo_dagga/game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: CaroroGame(),
      mouseCursor: SystemMouseCursors.none,
    );
  }
}
