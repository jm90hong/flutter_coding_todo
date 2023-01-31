import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('앱 정보',style: TextStyle(color: Colors.black, fontFamily: 'noto_black',fontSize: 20),),
          buildlInfoBox(title: '만든이', content: '홍정민'),
          buildlInfoBox(title: '버전', content: '1.0.0'),
          buildlInfoBox(title: '보유기술', content: '#Flutter #Spring #서버 #DB'),
        ],
      ),
    );
  }

  Widget buildlInfoBox({required String title, required String content}){
    return Container(
      margin: EdgeInsets.only(top: 14),
      child: Column(
        children: [
          Text(title,style: TextStyle(color: Color(0xff999999)),),
          Text(content,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
        ],
      ),
    );
  }


}
