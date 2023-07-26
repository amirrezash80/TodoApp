import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/ToDo.dart';
class ProviderController extends ChangeNotifier {
  List<Todo> Todo_list = [];

  void Add_to_List(String name) {
    Todo_list.add(Todo(todoTitle: name, completed: false));
    notifyListeners();
  }


  void Delete(Todo item) {
    Todo_list.remove(item);
    notifyListeners();
  }

  void toggle(Todo item) {
    final index = Todo_list.indexOf(item);
    Todo_list[index].completed = !Todo_list[index].completed;

    notifyListeners();
  }

}


