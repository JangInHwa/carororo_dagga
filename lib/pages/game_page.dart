import 'package:carororo_dagga/controller.dart';
import 'package:carororo_dagga/game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GamePage extends StatelessWidget {
  GamePage({super.key}) {
    Get.find<ScoreController>().score.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          GameWidget(
            game: CaroroGame(),
            mouseCursor: SystemMouseCursors.none,
          ),
          Positioned(
            right: 24,
            top: 60,
            child: Obx(
              () {
                int score = Get.find<ScoreController>().score.value;
                return Text(
                  score.toString(),
                  style: const TextStyle(fontSize: 48),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
