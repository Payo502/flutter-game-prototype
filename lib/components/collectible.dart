import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

class Collectible extends SpriteComponent with HasGameRef, CollisionCallbacks {
  Collectible({Vector2? position})
      : super(size: Vector2(30, 30), position: position ?? Vector2.zero());

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('ball.png');

    add(CircleHitbox());
  }
}