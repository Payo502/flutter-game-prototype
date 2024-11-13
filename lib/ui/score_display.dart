import 'package:flutter/material.dart';

class ScoreDisplay extends StatelessWidget {
  final int score;

  const ScoreDisplay({Key? key, required this.score}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 20,
        left: 20,
        child: Text(
          'Score: $score',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        )
    );
  }
}