
import 'package:flutter/material.dart';
import 'package:flutter_coding_todo/config/config.dart';
import 'package:flutter_coding_todo/screen/page/add_todo_page.dart';
import 'package:flutter_coding_todo/screen/page/todo_list_page.dart';

import 'page/info_page.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int curIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.amber,
        child: IndexedStack(
          index: curIndex,
          children: [
            TodoListPage(),
            AddTodoPage(
              onAdd: (){
                setState(() {
                  curIndex=0;
                });
              },
            ),
            InfoPage()
          ],
        )
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: '공부등록',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: '앱정보',
          ),
        ],
        currentIndex: curIndex,
        selectedItemColor:appMainColor,
        onTap: (index){
          setState(() {
            curIndex=index;
          });
        },
      ),
    );
  }
}
