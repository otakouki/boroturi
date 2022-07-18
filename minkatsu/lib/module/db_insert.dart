import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../database/create_database.dart';
import '../database/insert_database.dart';
import 'db_chart.dart';

class Db_ins {
  static DateTime daytime = DateTime.now();
  static bool sleep = true;
  static DateTime day = DateTime(2022, 7, 15, 16, 51, 58);
  static bool sleeping = true;
  static List<DateTime> sleeptime = [DateTime.now()];
  static int i = 0;
  static int j = 0;
  static int cnt = 0;

  bool flag;
  int timercnt;
  String buttunflag;

  Db_ins(this.flag, this.timercnt, this.buttunflag) {
    // 起きた時の処理

    if (flag == true &&
        timercnt == 0 &&
        sleeping == false &&
        buttunflag == "off") {
      print("寝た：" "$day " " $sleeping");
      print("起きた：" "$daytime " "$sleep");
      daytime = DateTime.now();
      sleep = true;
      // print(sleeptime);
      DateTime today = DateTime.now();
      int cnt1 = sleeptime.length;
      for (i = 0; i < cnt1; i++) {
        for (j = 1; j < cnt1; j++) {
          var diff = today.difference(sleeptime.elementAt(j));
          print("sleeptime:" "${sleeptime.elementAt(i).minute}");
          print("today:" "${today.minute}");
          if (diff.inDays == 0 && diff.inMinutes <= 10 && diff.inMinutes >= 0) {
            sleeptime.removeAt(j);
            cnt1 = sleeptime.length;
          }
        }
      }
      print("removeAt:" "${sleeptime}");
      timer_ins(daytime, sleep);
      timer_ins(sleeptime.elementAt(sleeptime.length - 1), sleeping);
      Db_sec().chart();
      sleeptime.clear();
      sleeping = true;
    }
    // 寝た時の処理
    if (flag == false) {
      print(cnt);
      if (cnt == 0) {
        day = DateTime.now();
        sleeptime.add(DateTime.now());
        sleeptime.removeAt(0);
        cnt = 1;
      } else {
        DateTime flg = DateTime.now();

        var a = flg.difference(day);
        if (a.inHours > 0 || a.inSeconds >= 1) {
          day = DateTime.now();
          sleeptime.add(DateTime.now());
        }
      }

      sleeping = false;
      print("db_insert sleeptime:" "$sleeptime");
      // print("db_insert 寝た：" "$day " "$sleeping");
    }
  }

  void timer_ins(DateTime daytime, bool sleep) async {
    await GetupDB.database;
    await InsertDatabase().insertGetup(GetupDB(daytime: daytime, getup: sleep));
  }
}
