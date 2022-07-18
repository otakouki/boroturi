import 'dart:ffi';

import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'create_database.dart';

class InsertDatabase {
  DateTime dummyDaytime = DateTime(2022, 06, 18, 14, 00);
  bool dummyGetup = false;

  Future<void> insertGetup(GetupDB getupDB) async {
    var bedtime = GetupDB(
      daytime: dummyDaytime,
      getup: dummyGetup,
    );
    final Database db = await GetupDB.database;
    await db.insert('getup', getupDB.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("iinsert end");
  }
}
