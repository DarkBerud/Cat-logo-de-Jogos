import 'package:flutter/material.dart';
import 'package:projeto_catalogo_jogos/components/titleButton.dart';
import 'package:projeto_catalogo_jogos/data/game_dao.dart';

import '../components/title.dart';

class gameForm extends StatefulWidget {
  const gameForm({Key? key}) : super(key: key);

  @override
  State<gameForm> createState() => _gameFormState();
}

class _gameFormState extends State<gameForm> {
  TextEditingController titleController = TextEditingController();
  TextEditingController plataformController = TextEditingController();
  TextEditingController genreController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController mediaController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Game Form"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 650,
            width: 375,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (String? value) {
                      if (valueValidator(value)) {
                        return "Insira um Titulo!";
                      }
                      return null;
                    },
                    controller: titleController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Insira um Titulo",
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (String? value) {
                      if (valueValidator(value)) {
                        return "Insira uma Plataforma!";
                      }
                      return null;
                    },
                    controller: plataformController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Insira uma Plataforma",
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (String? value) {
                      if (valueValidator(value)) {
                        return "Insira um Genero!";
                      }
                      return null;
                    },
                    controller: genreController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Insira um Genero",
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (String? value) {
                      if (valueValidator(value)) {
                        return "Insira uma Mídia!";
                      }
                      return null;
                    },
                    controller: mediaController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Insira uma Mídia",
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (text) {
                      setState(() {});
                    },
                    validator: (String? value) {
                      if (valueValidator(value)) {
                        return "Insira um URL de Imagem!";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.url,
                    controller: imageController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Insira uma Capa",
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 72,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imageController.text,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Image.asset("assets/images/nophoto.png");
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                      GameDao().save(gameTitleButton(
                          titleController.text,
                          plataformController.text,
                          genreController.text,
                          mediaController.text,
                          imageController.text));
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Jogo adicionado")));
                      Navigator.pop(context);
                    // }
                    },
                  child: Text("Adicionar"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
