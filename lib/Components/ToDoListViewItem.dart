import 'package:flutter/material.dart';
import 'package:todo_app/Models/ToDoModel.dart';

class ToDoListViewItem extends StatelessWidget{
  final ToDoModel _todo;

  ToDoListViewItem(this._todo);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(bottom: 10),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 0.5, color: Colors.black12),
          boxShadow: [BoxShadow(
            color: Colors.black26,
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 2)
          )]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_todo.todo)
          ],
        ),
      );
  }
}