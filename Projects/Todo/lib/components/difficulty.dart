import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final class DifficultyStars extends StatelessWidget {

  final int dificuldade;

  const DifficultyStars({super.key, required this.dificuldade});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Icon(
          Icons.star,
          color: (dificuldade >= 1)
              ? Colors.pinkAccent
              : Colors.pinkAccent[100],
          size: 20,
        ),
        Icon(
          Icons.star,
          color: (dificuldade >= 2)
              ? Colors.pinkAccent
              : Colors.pinkAccent[100],
          size: 20,
        ),
        Icon(
          Icons.star,
          color: (dificuldade >= 3)
              ? Colors.pinkAccent
              : Colors.pinkAccent[100],
          size: 20,
        ),
        Icon(
          Icons.star,
          color: (dificuldade >= 4)
              ? Colors.pinkAccent
              : Colors.pinkAccent[100],
          size: 20,
        ),
        Icon(
          Icons.star,
          color: (dificuldade >= 5)
              ? Colors.pinkAccent
              : Colors.pinkAccent[100],
          size: 20,
        ),
      ],
    );
  }
}