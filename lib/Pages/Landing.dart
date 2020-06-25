import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Components/SearchInput.dart';
import 'package:todo_app/Components/ToDoListViewItem.dart';
import 'package:todo_app/Models/ToDoModel.dart';
import 'package:todo_app/Pages/CreateToDo.dart';
import 'package:todo_app/Providers/ToDoProvider.dart';

class Landing extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LandingState();
}

class _LandingState extends State<Landing>{
  bool _isInitialized = false;

  String filter = "";

  TodoProvider _provider;

  _initialize(){
    _isInitialized = true;
  }

  @override
  void dispose() {
    _provider.dispose();

    super.dispose();
  }

  void _onSearchChanged(String text){
    setState(() {
      filter = text;
    });
  }

  _getRow(BuildContext context, int index, List<ToDoModel> todos){
    var item = todos[index];
    return Dismissible(
      key: Key(item.hashCode.toString()),
      child: ToDoListViewItem(item),
      onDismissed: (direction) {
        Provider.of<TodoProvider>(context, listen: false).removeToDo(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if(!_isInitialized){
      _initialize();
    }

    var todos = Provider.of<TodoProvider>(context).todos.where((element) => element.todo.toLowerCase().indexOf(filter.toLowerCase()) >= 0).toList();

    return Scaffold(
      body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Column(
              children: <Widget>[
                SearchInput(onChanged: this._onSearchChanged),
                Expanded(
                  child: todos.length != 0 ? ListView.builder(
                    padding: EdgeInsets.only(top: 15),
                    itemCount: todos.length,
                    itemBuilder: (ctx, index) => this._getRow(ctx, index, todos),
                  ) : Center(
                    child: Text("No items"),
                  )
                ),
              ],
            )
          )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => CreateToDo())); },
          child: Icon(Icons.add),
        ),
    );
  }
}