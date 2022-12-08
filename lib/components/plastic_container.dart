import 'dart:math';
import 'package:carororo_dagga/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class DirtyPlasticContainer extends CircleComponent with HasGameRef<CaroroGame> {
  static Vector2 initialSize = Vector2.all(140);
  static const speed = 150;
  DirtyPlasticContainer({super.position})
      : super(
          radius: initialSize.x / 2,
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    paint.color = Colors.blue;
    add(SpriteComponent(sprite: await Sprite.load('dirty_container.png'), size: size));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    y += dt * speed;
    super.update(dt);
  }
}

class CleanPlasticContainer extends CircleComponent with HasGameRef<CaroroGame> {
  static Vector2 initialSize = Vector2.all(140);
  CleanPlasticContainer({super.position})
      : super(
          radius: initialSize.x / 2,
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    paint.color = Colors.blue;
    add(SpriteComponent(sprite: await Sprite.load('clean_container.png'), size: size));
    return super.onLoad();
  }
}

class PlasticContainerCreator extends TimerComponent with HasGameRef {
  final Random random = Random();
  final _halfWidth = DirtyPlasticContainer.initialSize.x / 2;

  PlasticContainerCreator() : super(period: 1, repeat: true);

  @override
  void onTick() {
    gameRef.add(
      DirtyPlasticContainer(
        position: Vector2(
          _halfWidth + (gameRef.size.x - DirtyPlasticContainer.initialSize.x) * random.nextDouble(),
          0,
        ),
      ),
    );
  }
}
