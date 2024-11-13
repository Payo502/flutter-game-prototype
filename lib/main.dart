import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:prototype_game/my_game.dart';
import 'ui/score_display.dart';

void main() {
  final game = MyGame();
  runApp(
    GameWidget(
      game: game,
      overlayBuilderMap: {
        'Score Display': (context, MyGame game) => ScoreDisplay(score: game.score),
      },
    ),
  );
}
