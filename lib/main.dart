import 'package:flutter/material.dart';
import 'package:flutter_coding_todo/config/config.dart';
import 'package:provider/provider.dart';

import 'provider/todo_provider.dart';
import 'screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => TodoProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',

        theme: ThemeData(
          fontFamily: 'noto',
          primaryColor: appMainColor,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
