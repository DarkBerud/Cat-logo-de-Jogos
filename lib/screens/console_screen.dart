import 'package:flutter/material.dart';
import 'package:projeto_catalogo_jogos/components/titleButton.dart';
import 'package:projeto_catalogo_jogos/data/game_dao.dart';
import 'package:projeto_catalogo_jogos/screens/game_form.dart';

class consoleScreen extends StatefulWidget {
  const consoleScreen({Key? key}) : super(key: key);

  @override
  State<consoleScreen> createState() => _consoleScreenState();
}

class _consoleScreenState extends State<consoleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text("Lista dos títulos"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<gameTitleButton>>(
            future: GameDao().findAll(),
            builder: (context, snapshot) {
              List<gameTitleButton>? items = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text("Carregando"),
                      ],
                    ),
                  );
                  break;
                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text("Carregando"),
                      ],
                    ),
                  );
                  break;
                case ConnectionState.active:
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text("Carregando"),
                      ],
                    ),
                  );
                  break;
                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext contex, int index) {
                            final gameTitleButton game = items[index];
                            return game;
                          });
                    }
                    return Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 128,
                          ),
                          Text(
                            "Tu não tem nenhum jogo",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 32,
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "no catálogo, bora catalogar!!!",
                            style: TextStyle(fontSize: 32),
                          ),
                        ],
                      ),
                    );
                  }
                  return Center(
                    child: Text(
                      "Erro ao carregar os jogos",
                      style: TextStyle(fontSize: 32),
                    ),
                  );
                  break;
              }
              return Text("Erro desconhecido");
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (contextNew) => gameForm()),
          ).then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
