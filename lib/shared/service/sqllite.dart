import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../modules/episode/models/episodeSqlModel.dart';

const _table = 'episodes';
const String queryCreateDb =
    "CREATE TABLE episodes(id INTEGER PRIMARY KEY,episodeId INTEGER, favorite INTEGER, watched INTEGER,name STRING, episode STRING, dateRelease STRING)";

class SqlLite {
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'sql5.db'),
      onCreate: (db, version) {
        return db.execute(queryCreateDb);
      },
      version: 1,
    );
  }

  Future insert(EpisodeSqlModel model) async {
    try {
      final Database db = await _getDatabase();
     await db.insert(
        _table,
        model.toMap(),
      );
    } catch (error) {
      print(error);
    }
  }

  getEpisodes() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> data = await db.query(_table);
      return data;
    } catch (ex) {
      print(ex);
    }
  }

  existEpisodesById(int id) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> data =
          await db.query(_table, where: "episodeId = ?", whereArgs: [id]);

      if (data.isEmpty) {
        return false;
      } else {
        return true;
      }
    } catch (ex) {
      print(ex);
    }
  }

  getdbEpisodeInfo(int id) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> data =
          await db.query(_table, where: "episodeId = ?", whereArgs: [id]);
        return data[0];     
    } catch (ex) {
      print(ex);
    }
  }
  updateEpisode(int episodeId,favorite) async {
    final Database db = await _getDatabase();
   int count = await db.rawUpdate(
    'UPDATE $_table SET favorite = ? WHERE episodeId = ?',
    [favorite, episodeId]);

  }
}
