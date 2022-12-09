import 'package:carororo_dagga/components/caroro.dart';
import 'package:carororo_dagga/components/deadline.dart';
import 'package:carororo_dagga/components/plastic_container.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

class CaroroGame extends FlameGame with HasCollisionDetection, MouseMovementDetector, TapDetector, LongPressDetector, PanDetector {
  Caroro caroro = Caroro();

  @override
  Color backgroundColor() => Colors.transparent;

  @override
  Future<void>? onLoad() async {
    add(caroro);
    caroro.priority = 1;

    add(PlasticContainerCreator());

    add(DeadLine());
    // add(DirtyPlasticContainer());
    // add(CleanPlasticContainer());
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    caroro.position += info.delta.game.xy;
    super.onPanUpdate(info);
  }

  @override
  void onMouseMove(PointerHoverInfo info) {
    caroro.position = info.eventPosition.game;
    super.onMouseMove(info);
  }
}
