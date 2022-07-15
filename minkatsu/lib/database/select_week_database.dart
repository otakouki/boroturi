import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'create_database.dart';

class SelectWeekData {
  Future<List<GetupDB>> selectGetups() async {
    final Database db = await GetupDB.database;
    final List<Map<String, dynamic>> maps =
        await db.rawQuery('SELECT * FROM getup ORDER BY id DESC LIMIT 0, 14 ;');
    // print(maps[0]['getup'] == 0 ? false : true);
    // print(maps[1]['getup'] == 0 ? false : true);
    // print(maps.length);
    return List.generate(maps.length, (i) {
      return GetupDB(
        daytime: DateTime.parse(maps[i]['daytime']),
        getup: maps[i]['getup'] == 0 ? false : true,
      );
    });
  }
}
