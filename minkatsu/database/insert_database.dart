import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'create_database.dart';


class InsertDatabase{
  DateTime dummyDaytime = DateTime(2022,06,17,14,00);
  bool dummyGetup = true;

  Future<void> insertGetup(GetupDB getupDB) async {
    var bedtime = GetupDB(
      daytime: dummyDaytime,
      getup: dummyGetup,
    );
    final Database db = await GetupDB.database;
    await db.insert(
        'getup',
        bedtime.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}