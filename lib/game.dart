import 'package:carororo_dagga/components/caroro.dart';
import 'package:carororo_dagga/components/deadline.dart';
import 'package:carororo_dagga/components/plastic_container.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

class CaroroGame extends FlameGame with HasCollisionDetection, MouseMovementDetector, TapDetector, LongPressDetector, PanDetector {
  Caroro caroro = Caroro();

  @override
  Future<void>? onLoad() async {
    final sprite = await loadSprite('background.jpg');
    add(
      SpriteComponent(
        sprite: sprite,
        position: size / 2,
        size: size,
        anchor: Anchor.center,
      ),
    );
    add(caroro);
    caroro.priority = 1;

    add(PlasticContainerCreator());

    add(DeadLine());
    // add(DirtyPlasticContainer());
    // add(CleanPlasticContainer());
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
