import 'package:projeto_catalogo_jogos/components/titleButton.dart';
import 'package:projeto_catalogo_jogos/data/database.dart';
import 'package:sqflite/sqflite.dart';

class GameDao {
  static const String tableSql = "CREATE TABLE $_tablename("
      "$_title TEXT, "
      "$_plataform TEXT, "
      "$_genre TEXT, "
      "$_media TEXT, "
      "$_image TEXT)";

  static const String _tablename = "consoleTable";
  static const String _title = "title";
  static const String _plataform = "plataform";
  static const String _genre = "genre";
  static const String _media = "media";
  static const String _image = "image";

  save(gameTitleButton tittle) async {
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(tittle.title);
    Map<String, dynamic> gameMap = toMap(tittle);
    if (itemExists.isEmpty) {
      return await bancoDeDados.insert(_tablename, gameMap);
    } else {
      return await bancoDeDados.update(
        _tablename,
        gameMap,
        where: "$_title = ?",
        whereArgs: [tittle.title],
      );
    }
  }

  Map<String, dynamic> toMap(gameTitleButton tittle) {
    final Map<String, dynamic> gamesMap = Map();
    gamesMap[_title] = tittle.title;
    gamesMap[_plataform] = tittle.plataform;
    gamesMap[_genre] = tittle.genre;
    gamesMap[_media] = tittle.media;
    gamesMap[_image] = tittle.image;
    return gamesMap;
  }

  Future<List<gameTitleButton>> findAll() async {
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
    await bancoDeDados.query(_tablename);
    return toList(result);
  }

  List<gameTitleButton> toList(List<Map<String, dynamic>> gamesMap) {
    final List<gameTitleButton> games = [];
    for (Map<String, dynamic> linha in gamesMap) {
      final gameTitleButton game = gameTitleButton(linha[_title],
          linha[_plataform], linha[_genre], linha[_media], linha[_image]);
      games.add(game);
    }
    return games;
  }

  Future<List<gameTitleButton>> find(String gameTittle) async {
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tablename,
      where: "$_title = ?",
      whereArgs: [gameTittle],
    );
    return toList(result);
  }

  delete(String gameTittle) async {
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados.delete(
      _tablename,
      where: "$_title = ?",
      whereArgs: [gameTittle],
    );
  }
}
