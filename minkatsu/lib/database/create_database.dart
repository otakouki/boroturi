import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

class GetupDB {
  final DateTime daytime;
  final bool getup;

  GetupDB({required this.daytime, required this.getup});

  Map<String, dynamic> toMap() {
    return {
      'daytime': daytime.toUtc().toIso8601String(),
      'getup': getup,
    };
  }

  @override
  String toString() {
    return 'GetupDB{day:$daytime, getup:$getup}';
  }

  static Future<Database> get database async {
    final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'getup_database.db'),
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE getup(id INTEGER PRIMARY KEY AUTOINCREMENT, daytime TEXT, getup BIT)");
      },
      version: 1,
    );
    return database;
  }
}
