import 'package:carororo_dagga/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Caroro extends CircleComponent with HasGameRef<CaroroGame> {
  Caroro()
      : super(
          radius: 40,
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    paint.color = Colors.red;
    position = Vector2(
      gameRef.size.x / 2,
      (gameRef.size.y - 2 * 80),
    );

    add(SpriteComponent(sprite: await Sprite.load('caroro.png'), size: size));
    return super.onLoad();
  }
}
