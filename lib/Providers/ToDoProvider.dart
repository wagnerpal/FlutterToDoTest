import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/Models/ToDoModel.dart';

class TodoProvider with ChangeNotifier{
  static const String STORE_KEY = "ToDoList";

  List<ToDoModel> todos;

  TodoProvider(){
    todos = List<ToDoModel>();
  }

  void init(){
    loadData();
  }

  addTodo(String category, ToDoModel todo){
    todos.add(todo);

    saveData();

    notifyListeners();
  }

  removeToDo(int todoId){
    todos.removeAt(todoId);

    saveData();

    notifyListeners();
  }

  setCompleted(int todoId, {bool isCompleted = true}){
    saveData();

    notifyListeners();
  }

  int get count{
    return todos.length;
  }

  Future saveData() async{
    var sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setStringList(STORE_KEY, todos.map((todo) => todo.todo).toList());
  }

  Future loadData() async{
    var sharedPreferences = await SharedPreferences.getInstance();

    var savedItems = sharedPreferences.getStringList(STORE_KEY);

    if(savedItems == null){
      return;
    }

    todos = savedItems.map((todo) => ToDoModel(todo)).toList();

    notifyListeners();
  }
}