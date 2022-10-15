import 'package:flutter/material.dart';

class consoleScreen extends StatelessWidget {
  const consoleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Console List"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 650,
            width: 375,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
