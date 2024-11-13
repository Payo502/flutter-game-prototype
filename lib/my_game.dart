import 'package:flame/camera.dart';
import 'package:flame/game.dart';
import 'bloc/game_bloc.dart';
import 'states/game_state.dart';
import 'ui/score_display.dart';

class MyGame extends FlameGame{
  final GameBloc gameBloc = GameBloc();
  int score = 0;

  @override
  Future<void> onLoad() async {
    camera.viewport = FixedResolutionViewport(resolution: Vector2(800,600));

    gameBloc.gameState.listen((GameState state) {
      if (state is GameStart) {
        print('Game Start');
      } else if (state is GameRunning) {
        print('Game Running');
      } else if (state is GameOver) {
        print('Game Over');
      }
    });

    overlays.add('Score Display');
  }

  @override
  void dispose() {
    gameBloc.dispose();
  }
}