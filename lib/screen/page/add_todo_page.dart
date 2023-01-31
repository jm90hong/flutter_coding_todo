import 'package:flutter/material.dart';
import 'package:flutter_coding_todo/config/config.dart';
import 'package:flutter_coding_todo/provider/todo_provider.dart';
import 'package:provider/provider.dart';

import '../../vo/todo.dart';

class AddTodoPage extends StatefulWidget {
  Function onAdd;

  AddTodoPage({
    required this.onAdd
  });


  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {

  final List<String> valueList = ['플러터','스프링','서버구축','데이터베이스'];
  late String selectedValue;

  final TextStyle ts = TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold);
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedValue=valueList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('공부일정 등록하기',style: TextStyle(color: Colors.black, fontFamily: 'noto_black',fontSize: 20),),
                SizedBox(height: 40,),
                Text('분야',style:ts),
                DropdownButton(
                    value:selectedValue,
                    items: valueList.map((value) => DropdownMenuItem(
                        value: value,
                        child: Text(value)
                    )).toList(),
                    onChanged: (value){

                      setState((){
                        selectedValue=value!;
                      });
                    }
                ),
                SizedBox(height: 30,),
                Text('공부내용',style: ts,),
                Container(
                  width: 250,
                  child: TextFormField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      hintText: '플러터 기초 공부'
                    ),
                  ),
                )
              ],
            ),
          ),

          GestureDetector(
            onTap: () async{
              print(selectedValue);
              print(textEditingController.text);

              Todo todo = Todo(
                type: selectedValue,
                title: textEditingController.text
              );

              var result = await Provider.of<TodoProvider>(context,listen: false).add(todo: todo);
              print(result);

              if(result=='ok'){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("공부일정 등록완료"),
                ));
                widget.onAdd();
              }else{
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("등록 실패"),
                ));
              }



            },
            child: Container(
              width: double.infinity,
              height: 50,
              color: appMainColor,
              child: Center(
                child: Text(
                  '공부 등록하기',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
