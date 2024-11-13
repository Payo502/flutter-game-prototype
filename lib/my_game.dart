import 'package:flame/camera.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'bloc/game_bloc.dart';
import 'ui/score_display.dart';
import 'states/game_state.dart';

// Components
import 'components/player.dart';
import 'components/enemy.dart';
import 'components/collectible.dart';

class MyGame extends FlameGame with HasKeyboardHandlerComponents, HasCollisionDetection{
  final GameBloc gameBloc = GameBloc();
  
  late Player _player;
  late Enemy _enemy;
  late Collectible _collectible;
  
  final ValueNotifier<int> score = ValueNotifier<int>(0);

  @override
  Future<void> onLoad() async {
    camera.viewport = FixedResolutionViewport(resolution: Vector2(800,600));

    
    gameBloc.gameState.listen((GameState state) {
      if (state is GameStart) {
      } else if (state is GameRunning) {
      } else if (state is GameOver) {
      }
    });

    _player = Player();
    _enemy = Enemy(position: Vector2(100, 100));
    _collectible = Collectible(position: Vector2(100, 400));
    
    add(_player);
    add(_enemy);
    add(_collectible);
    
    overlays.add('Score Display');
  }

  @override
  void dispose() {
    gameBloc.dispose();
    score.dispose();
  }
}