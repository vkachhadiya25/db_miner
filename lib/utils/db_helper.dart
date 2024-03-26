import 'dart:io';
import 'package:db_miner/screen/home/model/home_model.dart';
import 'package:db_miner/screen/model/db_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper
{
  static DbHelper dbHelper = DbHelper._();
  DbHelper._();

  Database? database;
  final String DB_NAME = "data.db";

  Future<Database> checkDB() async {
    if (database != null) {
      return database!;
    } else {
      return await initDB();
    }
  }

  Future<Database> initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, DB_NAME);
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String queryQuotesTable =
            "CREATE TABLE quotes(id INTEGER PRIMARY KEY AUTOINCREMENT, quotes TEXT,author TEXT,name Text)";
        String queryNameTable =
            "CREATE TABLE name(id INTEGER PRIMARY KEY AUTOINCREMENT,quotes TEXT,author TEXT,name Text)";
        String queryCategoryTable =
            "CREATE TABLE category(id INTEGER PRIMARY KEY AUTOINCREMENT,name Text)";
        db.execute(queryQuotesTable);
        db.execute(queryNameTable);
        db.execute(queryCategoryTable);
      },
    );
  }

  Future<void> insertQuotesData(DBModel dbModel) async {
    database = await checkDB();
    database!.insert("quotes", {
      "quotes": dbModel.quotes,
      "author": dbModel.author,
    });
  }


  Future<void> insertNameData(DBModel dbModel) async {
    database = await checkDB();
    database!.insert("name", {
      "quotes": dbModel.quotes,
      "author": dbModel.author,
    });
  }

  Future<void> insertCategoryData(String name) async {
    database = await checkDB();
    database!.insert("category", {
      "name": name
    });
  }

  Future<List<DBModel>> readQuotesData() async {
    database = await checkDB();
    String query = "SELECT * FROM quotes";
    List<Map> data = await database!.rawQuery(query, null);
    List<DBModel> modelList = data.map((e) => DBModel.mapToModel(e)).toList();
    return modelList;
  }

  Future<List<DBModel>> readNameData() async {
    database = await checkDB();
    String query = "SELECT * FROM name";
    List<Map> data = await database!.rawQuery(query, null);
    List<DBModel> modelList = data.map((e) => DBModel.mapToModel(e)).toList();
    return modelList;
  }

  Future<List<DBModel>> readCategoryData() async {
    database = await checkDB();
    String query = "SELECT * FROM category";
    List<Map> data = await database!.rawQuery(query, null);
    List<DBModel> modelList = data.map((e) => DBModel.mapToModel(e)).toList();
    return modelList;
  }

  Future<void> deleteQuotesData({required String id}) async {
    database = await checkDB();
    database!.delete("quotes", where: "id=?", whereArgs: [id]);
  }

  Future<void> deleteCategoryData({required String id}) async {
    database = await checkDB();
    database!.delete("category", where: "id=?", whereArgs: [id]);
  }
}