import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final class MyCard extends StatelessWidget {
  final Color color;
  final IconData? image;

  const MyCard({super.key, required this.color, this.image});

  IconData? get icon => image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        height: 120,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
          border: Border.all(
            color: Colors.black,
            width: 5,

          ),
        ),
        child: Icon(icon),
      ),
    );
  }
}
