import 'package:flutter/material.dart';

class ScoreDisplay extends StatelessWidget {
  final ValueNotifier<int> score;

  const ScoreDisplay({Key? key, required this.score}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 20,
        left: 20,
        child: ValueListenableBuilder<int>(
          valueListenable: score,
          builder: (context, score, child) {
            return Text('Score: $score', style: TextStyle(fontSize: 24, color: Colors.white));
          },
        )
    );
  }
}