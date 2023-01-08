
import 'package:flutter/material.dart';

import '../../config/config.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
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
                  child: Column(
                    children: [
                      TodoBox(
                        title: '플러터 디자인',
                        content: 'Container 공부하기',
                      ),
                      TodoBox(
                        title: '플러터 디자인1',
                        content: 'Container 공부하기1',
                      ),
                      TodoBox(
                        title: '플러터 디자인2',
                        content: 'Container 공부하기2',
                      ),
                      TodoBox(
                        title: '플러터 디자인3',
                        content: 'Container 공부하기3',
                      ),
                      TodoBox(
                        title: '플러터 디자인',
                        content: 'Container 공부하기',
                      ),
                      TodoBox(
                        title: '플러터 디자인1',
                        content: 'Container 공부하기1',
                      ),
                      TodoBox(
                        title: '플러터 디자인2',
                        content: 'Container 공부하기2',
                      ),
                      TodoBox(
                        title: '플러터 디자인3',
                        content: 'Container 공부하기3',
                      ),
                      TodoBox(
                        title: '플러터 디자인',
                        content: 'Container 공부하기',
                      ),
                      TodoBox(
                        title: '플러터 디자인1',
                        content: 'Container 공부하기1',
                      ),
                      TodoBox(
                        title: '플러터 디자인2',
                        content: 'Container 공부하기2',
                      ),
                      TodoBox(
                        title: '플러터 디자인3',
                        content: 'Container 공부하기3',
                      ),
                      TodoBox(
                        title: '플러터 디자인',
                        content: 'Container 공부하기',
                      ),
                      TodoBox(
                        title: '플러터 디자인1',
                        content: 'Container 공부하기1',
                      ),
                      TodoBox(
                        title: '플러터 디자인2',
                        content: 'Container 공부하기2',
                      ),
                      TodoBox(
                        title: '플러터 디자인3',
                        content: 'Container 공부하기3',
                      ),




                    ],
                  ),
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


  TodoBox({
    required this.title,
    required this.content
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

          OutlinedButton(
              onPressed: (){},
              child: Text('완료')
          )
        ],
      ),
    );
  }
}
