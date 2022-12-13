import 'dart:developer';

import 'package:carororo_dagga/components/caroro.dart';
import 'package:carororo_dagga/components/deadline.dart';
import 'package:carororo_dagga/components/plastic_container.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class CaroroGame extends FlameGame with HasCollisionDetection, MouseMovementDetector, TapDetector, LongPressDetector, PanDetector {
  Caroro caroro = Caroro();
  late double fallSpeed;

  @override
  Color backgroundColor() => Colors.transparent;

  @override
  Future<void>? onLoad() async {
    add(caroro);
    caroro.priority = 1;
    fallSpeed = 30 * size.y / 844;
    dev.log(fallSpeed.toString());

    add(PlasticContainerCreator());

    add(DeadLine());
  }

  @override
  void update(double dt) {
    super.update(dt);
    fallSpeed += dt * size.y / 844;
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
