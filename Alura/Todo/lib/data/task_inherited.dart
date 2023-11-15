import 'package:flutter/cupertino.dart';
import '../components/todo_card.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  final List<TodoCard> list = [
    TodoCard(
        'Aprender Flutter',
        "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
        3),
    TodoCard(
        'Andar de Bike',
        "https://jasminealimentos.com/wp-content/uploads/2022/06/Blog1_IMG_1-1-860x485.png",
        2),
    TodoCard(
        'Meditar',
        "https://catracalivre.com.br/wp-content/uploads/sites/19/2017/05/Medita%C3%A7%C3%A3o-iStock.jpg",
        5),
  ];

  void addNewTask(String name , String photoUrl, int difficulty){
    TodoCard newCard = TodoCard(name, photoUrl, difficulty);
    list.add(newCard);
  }

  double getSum(){
    var sum = 0.0;
    list.forEach((element) {
      var ele = (element.nivel / element.dificulty) as double;
      sum += ele;
      print(ele);
    });
    return sum;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return old.list.length != list.length;
  }
}
