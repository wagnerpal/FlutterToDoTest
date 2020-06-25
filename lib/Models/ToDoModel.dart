class ToDoModel{
  String todo;

  bool isCompleted = false;
  
  ToDoModel(this.todo);

  setCompleted({bool isCompleted = true}){
    this.isCompleted = isCompleted;
  }
}