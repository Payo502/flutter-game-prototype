import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

class Enemy extends SpriteComponent with HasGameRef, CollisionCallbacks{
  final double _speed = 200;
  int health = 100;

  Enemy({Vector2? position}) : super(size: Vector2(40, 40), position: position ?? Vector2.zero());

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('enemy.png');
    
    add(CircleHitbox());
  }
  
  @override
  void update(double dt) {
    super.update(dt);
  }
  
  void takeDamage(int damage) {
    health -= damage;
    if (health <= 0) {
      removeFromParent();
    }
  }
}