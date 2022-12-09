import 'dart:math';
import 'package:carororo_dagga/controller.dart';
import 'package:carororo_dagga/game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PlasticContainer extends CircleComponent with HasGameRef<CaroroGame> {
  final Vector2 speed;
  final String? sprite;
  PlasticContainer({
    required this.speed,
    required super.radius,
    this.sprite,
    super.position,
  }) : super(
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    if (sprite != null) {
      add(SpriteComponent(sprite: await Sprite.load(sprite!), size: size));
    }
    add(CircleHitbox(isSolid: true));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (x - size.x / 2 <= 0 || x + size.x / 2 >= gameRef.size.x) {
      speed.x *= -1;
    }
    position += speed.scaled(dt);
    super.update(dt);
  }
}

class DirtyPlasticContainer extends PlasticContainer with CollisionCallbacks {
  Vector2 caroroPosition1Before = Vector2(0, 0);
  Vector2 caroroPosition2Before = Vector2(0, 0);
  double demageSum = 0;

  DirtyPlasticContainer({
    super.position,
    required super.speed,
    required super.radius,
  }) : super(
          sprite: 'dirty_container.png',
        );

  @override
  void update(double dt) {
    if (activeCollisions.contains(gameRef.caroro)) {
      double deltaAngle = (caroroPosition1Before - caroroPosition2Before).normalized().distanceTo((gameRef.caroro.position - caroroPosition1Before).normalized());
      double caroroSpeed = gameRef.caroro.position.distanceTo(caroroPosition1Before) / dt;
      double demange = caroroSpeed * deltaAngle;
      demageSum += demange;

      if (demageSum > 50000) {
        Get.find<ScoreController>().score.value++;

        HapticFeedback.vibrate();

        gameRef.add(CleanPlasticContainer(position: position, speed: speed, radius: radius));
        removeFromParent();
      }
    }
    caroroPosition1Before.copyInto(caroroPosition2Before);
    gameRef.caroro.position.copyInto(caroroPosition1Before);
    super.update(dt);
  }
}

class CleanPlasticContainer extends PlasticContainer {
  CleanPlasticContainer({
    super.position,
    required super.speed,
    required super.radius,
  }) : super(
          sprite: 'clean_container.png',
        );
}

class PlasticContainerCreator extends TimerComponent with HasGameRef {
  final Random random = Random();
  final double radius = 70;

  PlasticContainerCreator() : super(period: 3, repeat: true);

  @override
  void onTick() {
    DirtyPlasticContainer newContainer = DirtyPlasticContainer(speed: Vector2(random.nextDouble() * 80 - 40, 100), radius: radius);
    newContainer.position = Vector2(radius + (gameRef.size.x - 2 * radius) * random.nextDouble(), -radius);
    gameRef.add(newContainer);
  }
}
