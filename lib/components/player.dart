import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame/src/game/flame_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prototype_game/components/collectible.dart';
import '../states/player_state.dart';
import 'package:flame/collisions.dart';

import 'enemy.dart';
import '../my_game.dart';

class Player extends SpriteComponent
    with HasGameRef<MyGame>, KeyboardHandler, CollisionCallbacks {
  final double _speed = 200;
  int health = 3;

  PlayerState state = PlayerState.idle;

  Vector2 direction = Vector2.zero();

  bool isAttacking = false;

  Player() : super(size: Vector2(50, 50));

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('player.png');
    position = gameRef.size / 2;

    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.add(direction.normalized() * _speed * dt);

    if (isAttacking) {
      isAttacking = false;
    }
  }

  @override
  void onCollision(Set<Vector2> intersectPoints, PositionComponent other) {
    if (other is Enemy) {
      health -= 1;
      if (health <= 0) {
        gameRef.gameBloc.endGame();
      }
    } else if (other is Collectible) {
      other.removeFromParent();
      gameRef.score.value += 1;
    }
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    direction = Vector2.zero();
    if (keysPressed.contains(LogicalKeyboardKey.arrowUp)) {
      direction.y -= 1;
    }
    if (keysPressed.contains(LogicalKeyboardKey.arrowDown)) {
      direction.y += 1;
    }
    if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      direction.x -= 1;
    }
    if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      direction.x += 1;
    }

    if (direction == Vector2.zero()) {
      state = PlayerState.idle;
    } else {
      state = PlayerState.moving;
    }

    if (keysPressed.contains(LogicalKeyboardKey.space)) {
      isAttacking = true;
    }

    return true;
  }
}
