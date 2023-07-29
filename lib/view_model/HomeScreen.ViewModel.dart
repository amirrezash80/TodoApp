import 'package:flutter/material.dart';

import '../model/ToDo.dart';

class ProviderController extends ChangeNotifier {
  List<Todo> Todo_list = [];
  List<Todo> Completed_List = [];

  void Add_to_List(Todo item) {
    // Completed_List.remove(item);
    Todo_list.add(item);
    notifyListeners();
  }

  void Add_to_CompletedList(Todo task) {
    // Todo_list.remove(task);
    Completed_List.add(task);
    notifyListeners();
  }

  void Delete(Todo item) {
    item.completed ? Completed_List.remove(item) : Todo_list.remove(item);
    notifyListeners();
  }


  void toggle(Todo item) {
    // print("first ${Completed_List.length}");
    var index = Todo_list.indexOf(item);
    // print(Todo_list.indexOf(item));
    Add_to_CompletedList(item);
    index = Completed_List.indexOf(item);
    // print(Completed_List.indexOf(item));
    Delete(item);
    Completed_List[index].completed = true;
    // print(Todo_list.indexOf(item));
    // print("second ${Completed_List.length}");
    notifyListeners();
    // print("third ${Completed_List.length}");

  }

  void toggleCompletedList(Todo item) {
    var index = Completed_List.indexOf(item);
    // print(Completed_List.indexOf(item));
    Add_to_List(item);
    index = Todo_list.indexOf(item);
    // print(Completed_List.indexOf(item));
    Delete(item);
    Todo_list[index].completed = false;
    // print(Completed_List.indexOf(item));
    notifyListeners();
  }

}
