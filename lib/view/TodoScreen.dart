import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/view_model/HomeScreen.ViewModel.dart';

class TodoAction extends StatelessWidget {
  const TodoAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //store the value in a variable
    final ToDotask = Provider.of<ProviderController>(context);
    return ListView.builder(
      itemCount: ToDotask.Todo_list.length,
      itemBuilder: ((context, index) =>
          Dismissible(
            key: ValueKey(ToDotask.Todo_list[index].id),
            onDismissed:(direction){
              ToDotask.Delete(ToDotask.Todo_list[index]);
            } ,
            child: Card(
              shadowColor: Colors.deepPurple,
              child: ListTile(
                leading: Checkbox(
                  // toggle the task as index item
                  value: ToDotask.Todo_list[index].completed,
                  onChanged: ((_) => ToDotask.toggle(ToDotask.Todo_list[index])),
                ),
                //show all the task title
                title: Text(ToDotask.Todo_list[index].todoTitle, style: TextStyle(
                    decoration: ToDotask.Todo_list[index].completed ? TextDecoration
                        .lineThrough : TextDecoration.none,
                    color: ToDotask.Todo_list[index].completed ? Colors.blueGrey : Colors
                        .black
                ),
                ),
                trailing: IconButton(
                    onPressed: () {
                      //delete task as index item
                      ToDotask.Delete(ToDotask.Todo_list[index]);
                    },
                    icon: const Icon(Icons.delete,)),
              ),
            ),
          )),
    );
  }
}
