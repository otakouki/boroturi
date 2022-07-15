import 'dart:ffi';

import 'package:flutter/material.dart';
import '../database/create_database.dart';
import '../database/insert_database.dart';
import 'db_chart.dart';

class Db_ins {
  static DateTime daytime = DateTime.now();
  static bool sleep = true;
  static DateTime day = DateTime(2000, 1, 1);
  static bool sleeping = true;
  bool flag;
  static List<DateTime> sleeptime = [DateTime.now()];

  Db_ins(this.flag) {
    // 起きた時の処理

    if (flag == true) {
      print("寝た：" "$day " " $sleeping");
      print("起きた：" "$daytime " "$sleep");
      daytime = DateTime.now();
      sleep = true;
      // print(sleeptime);
      // timer_ins(daytime, sleep);
      // timer_ins(day, sleeping);
      Db_sec().chart();
    }
    // 寝た時の処理
    if (flag == false) {
      DateTime flg = DateTime.now();

      int a = flg.minute - day.minute;
      if (a >= 1) {
        day = DateTime.now();
        sleeptime.add(day);
      }
      //day = DateTime.now();

      sleeping = false;
      print("db_insert sleeptime:" "$sleeptime");
      print("db_insert 寝た：" "$day " "$sleeping");
    }
  }

  void timer_ins(DateTime daytime, bool sleep) async {
    await GetupDB.database;
    await InsertDatabase().insertGetup(GetupDB(daytime: daytime, getup: sleep));
  }
}
