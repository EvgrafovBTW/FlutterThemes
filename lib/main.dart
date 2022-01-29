// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget auth = Container(
      padding: const EdgeInsets.only(top: 150, left: 32, right: 32),
      child: Row(
        children: [Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'введите логин',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFFFFFF0),
                    
                    border: OutlineInputBorder(
                    ),
                    hintText: 'введите пароль',
                  ),
                ),
              ],
            )
          )
        ],
      )

    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(), // standard dark theme
      themeMode: ThemeMode.system, // device controls theme
      home: Scaffold(
        appBar: AppBar(
          title: Text('заголовок'),
            centerTitle: true,
          ),

        body: ListView(
          children:  [
            Text('тело', style: 
              TextStyle(
                fontSize: 40,
                color: Colors.deepOrangeAccent,
                fontFamily: 'Roboto',
              ), 
            ),
            auth,
          ],
        ),
      ),
    );
  }
}