
import 'package:flutter/material.dart';
import 'package:flutter_coding_todo/provider/todo_provider.dart';
import 'package:provider/provider.dart';

import '../../config/config.dart';
import '../../vo/todo.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TodoProvider>(context,listen: false).getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 80,),

          //todo 상단 바
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('안녕!',style: TextStyle(fontFamily: 'noto_black',fontSize: 22),),
                  Text('나의 코딩 공부 리스트')
                ],
              ),

              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network('https://picsum.photos/250?image=9',width: 60,height: 60,))
            ],
          ),

          SizedBox(height: 30,),

          //todo 리스트
          Expanded(
              child: Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Consumer<TodoProvider>(builder: (context, todoProvider, child){
                    return Column(
                      children: todoProvider.currentTodoList.map((todo) =>
                          TodoBox(
                            title: todo.type,
                            content: todo.title,
                            isComplete:todo.completeNy=='y' ? true : false,
                            onTap: () async{
                              var result = await Provider.of<TodoProvider>(context,listen: false).updateComplete(
                                  todo:Todo(
                                      todoIdx: todo.todoIdx,
                                      completeNy: 'y'
                                  )
                              );

                              if(result=='ok'){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text("${todo.title} 완료됨."),
                                ));
                              }

                            },
                          )
                      ).toList(),
                    );
                  },)
                ),
              )
          )



        ],
      ),
    );
  }
}



class TodoBox extends StatelessWidget {

  String title;
  String content;
  bool isComplete;
  Function onTap;


  TodoBox({
    required this.title,
    required this.content,
    required this.isComplete,
    required this.onTap
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: TextStyle(color: appMainColor,fontSize: 20),),
              Text(content)
            ],
          ),

          isComplete ?
          Text('완료됨') :
          OutlinedButton(
              onPressed: (){
                onTap();
              },
              child: Text('완료')
          )
        ],
      ),
    );
  }
}
