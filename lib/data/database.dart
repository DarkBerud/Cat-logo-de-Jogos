import 'package:path/path.dart';
import 'package:projeto_catalogo_jogos/data/game_dao.dart';
import 'package:sqflite/sqflite.dart';


Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), "game.db");
  return openDatabase(path, onCreate: (db, version) {
    db.execute(GameDao.tableSql);
  }, version: 1);
}
