import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), "game.db");
  return openDatabase(path, onCreate: (db, version) {
    db.execute(tableSql);
  }, version: 1);
}

const String tableSql = "CREATE TABLE $_tablename("
    "$_title TEXT, "
    "$_plataform TEXT, "
    "$_genre TEXT, "
    "$_image TEXT)";

const String _tablename = "consoleTable";
const String _title = "title";
const String _plataform = "title";
const String _genre = "genre";
const String _image = "image";