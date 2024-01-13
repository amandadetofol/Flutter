import 'package:flutter/material.dart';
import 'package:todo_app/components/difficulty.dart';

final class TodoCard extends StatefulWidget {
  final String taskName;
  final String foto;
  final int dificulty;
  int nivel = 0;

  TodoCard(this.taskName, this.foto, this.dificulty, {super.key});

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {

  Color backgroundColor = Colors.pink;
  List<MaterialColor> colors = [
    Colors.pink,
    Colors.green,
    Colors.yellow,
    Colors.red,
    Colors.purple,
    Colors.indigo];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
      child: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: backgroundColor,
              ),
              height: 140),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey,
                        ),
                        width: 100,
                        height: 140,
                        child:
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.network(
                              widget.foto,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                          width: 150,
                          child: Text(
                            widget.taskName,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        DifficultyStars(dificuldade: widget.dificulty),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          widget.nivel++;

                          if (widget.nivel == (10*widget.dificulty)){
                            widget.nivel = 0;
                            backgroundColor = _getColor(backgroundColor);
                          }
                        });
                      },
                      child: const SizedBox(
                        height: 35,
                        width: 20,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_drop_up,
                              size: 20.0,
                            ),
                            Text(
                              "UP",
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: (widget.nivel / widget.dificulty) / 10,
                      ),
                    ),
                    Text("Nível: ${widget.nivel}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16)),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Color _getColor(Color currentColor){
    int indexCorProcurada = colors.indexWhere((color) => color == currentColor);

    if (indexCorProcurada != -1) {
      int proximoIndice = (indexCorProcurada + 1) % colors.length;
      Color proximaCor = colors[proximoIndice];
      return proximaCor;
    } else {
      return Colors.white;
    }
  }
}