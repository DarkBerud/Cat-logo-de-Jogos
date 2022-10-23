import 'package:flutter/material.dart';
import 'package:projeto_catalogo_jogos/components/titleButton.dart';
import 'package:projeto_catalogo_jogos/screens/console_screen.dart';

import '../data/game_dao.dart';

class gameTitle extends StatelessWidget {
  final String title;
  final String plataform;
  final String genre;
  final String media;
  final String image;

  gameTitle(this.title, this.plataform, this.genre, this.media, this.image,
      {Key? key})
      : super(key: key);

  bool assetOrNetwork() {
    if (image.contains("http")) {
      return false;
    }
    return true;
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
                  child: Container(
                    width: 400,
                    height: 60,
                    color: Colors.white70,
                    child: Center(
                      child: Text(
                        "$title",
                        style: TextStyle(
                          fontSize: 24,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    width: 400,
                    height: 60,
                    color: Colors.white70,
                    child: Center(
                      child: Text(
                        "$plataform",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    width: 400,
                    height: 60,
                    color: Colors.white70,
                    child: Center(
                      child: Text(
                        "$genre",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    width: 400,
                    height: 60,
                    color: Colors.white70,
                    child: Center(
                      child: Text(
                        "$media",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    width: 400,
                    height: 60,
                    color: Colors.white70,
                    child: Center(
                      child: Text(
                        "$image",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
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
                      image,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Image.asset("assets/images/nophoto.png");
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        GameDao().save(gameTitleButton(
                            title,
                            plataform,
                            genre,
                            media,
                            image));
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Jogo atualizado")));
                        Navigator.pop(context);
                      },
                      child: Text("Atualizar"),
                    ),
                    ElevatedButton(
                      onPressed: () {showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          content: const Text('O jogo derá deletado, tem certeza?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancelar'),
                              child: const Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () {ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Jogo deletado")));
                              GameDao().delete(title);
                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (contextNew) => consoleScreen()),
                              );
                              },
                              child: const Text('Sim'),
                            ),
                          ],
                        ),
                      );
                      },
                      child: Text("Deletar"),
                    ),

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
