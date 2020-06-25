import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Models/ToDoModel.dart';
import 'package:todo_app/Providers/ToDoProvider.dart';

class CreateToDo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _CreateToDoState();
}

class _CreateToDoState extends State<CreateToDo>{
  final TextEditingController todoController = TextEditingController();

  void _createToDo(){
    var model = ToDoModel(todoController.text);

    Provider.of<TodoProvider>(context, listen: false).addTodo("x", model);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New ToDo"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              maxLines: 1,
              controller: todoController,
              decoration: InputDecoration(
                hintText: "ToDo",
                contentPadding: EdgeInsets.all(8.0),
                filled: true,
                fillColor: Colors.white70,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.green.shade200)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.green.shade200)
                )
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  child: Text('Create', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  elevation: 0,
                  minWidth: double.infinity,
                  height: 45,
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
                  onPressed: () { _createToDo(); }
                ),
              )
            )
          ],
        )
      )
    );
  }
}