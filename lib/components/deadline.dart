import 'package:carororo_dagga/components/plastic_container.dart';
import 'package:carororo_dagga/game.dart';
import 'package:carororo_dagga/pages/result_page.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeadLine extends RectangleComponent with CollisionCallbacks, HasGameRef<CaroroGame> {
  @override
  Future<void>? onLoad() {
    paint.color = Colors.red;
    size = Vector2(gameRef.size.x, 20);
    position = Vector2(0, gameRef.size.y + 140);
    add(RectangleHitbox());
    return super.onLoad();
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is CleanPlasticContainer) {
      gameRef.remove(other);
    }
    if (other is DirtyPlasticContainer) {
      Get.off(() => const ResultPage(), transition: Transition.noTransition);
    }
    super.onCollision(intersectionPoints, other);
  }
}
