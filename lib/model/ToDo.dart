import 'package:uuid/uuid.dart';


class Todo {
  String todoTitle;
  bool completed;
  String id;
  Todo({required this.todoTitle, this.completed = false}):id = Uuid().v4()  ;

// to toggle the task
  void toggleCompleted() {
    completed = !completed;
  }
}
