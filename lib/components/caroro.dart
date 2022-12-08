import 'package:carororo_dagga/game.dart';
import 'package:flame/collisions.dart';
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
    add(CircleHitbox());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (position.x < radius) {
      position.x = radius;
    } else if (position.x > gameRef.size.x - radius) {
      position.x = gameRef.size.x - radius;
    }
    super.update(dt);
  }
}
