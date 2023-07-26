import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/ToDo.dart';
import 'package:todolist/view_model/HomeScreen.ViewModel.dart';

import 'TodoScreen.dart';

class HomePage extends StatefulWidget {
final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textFieldController = TextEditingController();
  String newTask = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textFieldController.addListener(() {
      newTask = _textFieldController.text;
    });

  }

  void _submit() {
    Provider.of<ProviderController>(context, listen:false).Add_to_List(newTask);
    Navigator.pop(context);
    _textFieldController.clear();
  }

  @override
  Widget build(BuildContext context) {

  Future <void> _showdialog() async{
    return showDialog(
        context: context, builder: (context){
          return AlertDialog(
            title: Text("Add New Task"),
            content: TextField(
              autofocus: true,
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: "Add New Task"),
              onSubmitted: (_) => _submit(),
            ),
            actions: [
              ElevatedButton(
                onPressed: _submit,
                child: const Text("Submit"),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 40)),
              )
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            actionsAlignment: MainAxisAlignment.center,
          );
    });


  }
  return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(widget.title ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
    body: TodoAction(),
    floatingActionButton: FloatingActionButton(
      onPressed: () => _showdialog(),
      child: Icon(Icons.add),
    ),
    );
  }
}
