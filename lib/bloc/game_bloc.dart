import 'dart:async';
import '../states/game_state.dart';

class GameBloc {
  final _gameStateController = StreamController<GameState>.broadcast();
  
  GameState _currentState = GameStart();
  
  Stream<GameState> get gameState => _gameStateController.stream;
  
  void startGame() {
    _currentState = GameRunning();
    _gameStateController.sink.add(_currentState);
  }
  
  void endGame() {
    _currentState = GameOver();
    _gameStateController.sink.add(_currentState);
  }
  
  void dispose() {
    _gameStateController.close();
  }
}