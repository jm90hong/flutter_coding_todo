

class Todo{
  int todoIdx=0;
  String type='';
  String title='';
  String completeNy='n';
  String createdDate='';


  Todo({
    this.todoIdx=0,
    this.type='',
    this.title='',
    this.completeNy='n',
    this.createdDate='',
  });


  factory Todo.fromJson(Map<String, dynamic> json){
    return Todo(
      todoIdx: json['todo_idx'],
      type: json['type'],
      title:json['title'],
      completeNy: json['complete_ny'],
      createdDate: json['created_date']
    );
  }

}