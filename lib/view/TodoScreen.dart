import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/ToDo.dart';
import 'package:todolist/view_model/HomeScreen.ViewModel.dart';

class TodoAction extends StatelessWidget {
  const TodoAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final toDoTask = Provider.of<ProviderController>(context);

    return ListView.separated(
      itemCount: toDoTask.Todo_list.length + 1,
      separatorBuilder: (context, index) => SizedBox(height: 4),
      itemBuilder: (context, index) {
        if (index == toDoTask.Todo_list.length) {
          if (toDoTask.Completed_List.isNotEmpty) {
            return _buildCompletedList(context, toDoTask.Completed_List);
          } else {
            return Container();
          }
        } else {
          Todo task = toDoTask.Todo_list[index];
          return Dismissible(
            key: ValueKey(task.id),
            onDismissed: (direction) {
              toDoTask.Delete(task);
            },
            child: _buildTodoItem(context, task, toDoTask),
          );
        }
      },
    );
  }

  Widget _buildCompletedList(BuildContext context, List<Todo> completedList) {
    return Column(
      children: [
        SizedBox(height: 16),
        ListTile(
          title: Text(
            "Completed",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: 8),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: completedList.length,
          separatorBuilder: (context, index) => SizedBox(height: 4),
          itemBuilder: (context, completedIndex) {
            Todo completedTask = completedList[completedIndex];
            return Dismissible(
              key: ValueKey(completedTask.id),
              onDismissed: (direction) {
                Provider.of<ProviderController>(context, listen: false).Delete(completedTask);
              },
              child: _buildCompletedItem(context, completedTask),
            );
          },
        ),
      ],
    );
  }

  Widget _buildTodoItem(BuildContext context, Todo task, ProviderController toDoTask) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.deepPurple,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        leading: Checkbox(
          value: task.completed,
          onChanged: (_) {
            toDoTask.toggle(task);
          },
        ),
        title: Text(
          task.todoTitle,
          style: TextStyle(
            decoration: task.completed ? TextDecoration.lineThrough : TextDecoration.none,
            color: task.completed ? Colors.blueGrey : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20

          ),
        ),
        trailing: IconButton(
          onPressed: () {
            toDoTask.Delete(task);
          },
          icon: Icon(Icons.delete, color: Colors.red),
        ),
      ),
    );
  }

  Widget _buildCompletedItem(BuildContext context, Todo completedTask) {
    return Card(
      color: Colors.deepPurple.shade100,
      shadowColor: Colors.blueGrey,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        leading: Checkbox(
          value: completedTask.completed,
          onChanged: (_) {
            Provider.of<ProviderController>(context, listen: false).toggleCompletedList(completedTask);
          },
        ),
        title: Text(
          completedTask.todoTitle,
          style: TextStyle(
            decoration: completedTask.completed ? TextDecoration.lineThrough : TextDecoration.none,
            color: completedTask.completed ? Colors.blueGrey : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
        ),
        trailing: Icon(Icons.done, color: Colors.green),
      ),
    );
  }
}
