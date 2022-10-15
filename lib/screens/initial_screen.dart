import 'package:flutter/material.dart';

class initialScreen extends StatefulWidget {
  const initialScreen({Key? key}) : super(key: key);

  @override
  State<initialScreen> createState() => _initialScreenState();
}

class _initialScreenState extends State<initialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pagina Inicial")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Colors.amber,
                child: Center(child: Text('$index')),
              );
            }),
      ),
    );
  }
}
