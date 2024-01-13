import 'package:flutter/material.dart';

import '../data/task_inherited.dart';

final class GlobalLevel extends StatefulWidget {
  double level = 0.0;

  @override
  State<GlobalLevel> createState() => _GlobalLevelState();
}

class _GlobalLevelState extends State<GlobalLevel> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
      SizedBox(
        width: 100,
        child: LinearProgressIndicator(
          color: Colors.white,
          value: (widget.level / 100),
        ),
      ),
      Text("Nível: ${widget.level.toStringAsFixed(2)}",
        style: TextStyle(color: Colors.white),),
      IconButton(
          onPressed: () {
            setState(() {
              widget.level = TaskInherited.of(context).getSum();
            });
          },
          icon: Icon(
            Icons.refresh,
            color: Colors.white,))
    ]);
  }
}
