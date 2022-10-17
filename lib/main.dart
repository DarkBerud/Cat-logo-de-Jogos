import 'package:flutter/material.dart';
import 'package:projeto_catalogo_jogos/components/title.dart';
import 'package:projeto_catalogo_jogos/components/titleButton.dart';
import 'package:projeto_catalogo_jogos/screens/console_screen.dart';
import 'package:projeto_catalogo_jogos/screens/game_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
       home: consoleScreen(),
       // home: gameTitleButton("One piece", "PC", "Action", "Digital","https://srv.latostadora.com/designall.dll/monkey_d_luffy_8bit__mujer--i:14138549542514138515;d:495425;w:240;b:005195;m:1.jpg"),
    );
  }
}
