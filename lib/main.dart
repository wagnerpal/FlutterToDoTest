import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Pages/Landing.dart';
import 'Providers/ToDoProvider.dart';

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoProvider>(
      create: (context){
        var provider = TodoProvider();

        provider.init();

        return provider;
      },
      child: new MaterialApp(
        title: 'ToDo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Landing(),
        debugShowCheckedModeBanner: false,
      )
    );
  }
}