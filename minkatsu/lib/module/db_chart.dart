import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import '../database/create_database.dart';
import '../database/insert_database.dart';
import '../database/select_week_database.dart';

class Db_sec {
  static List<GetupDB> journals = [];
  static int i = 0;
  static int cnt1 = 0;

  Db_sec() {
    //print(cnt1);
    if (cnt1 >= 0 && journals.length >= 1) {
      //print("test");
      journals.asMap();
      //print(journals[0].daytime);
    }
    chart();
  }

  void chart() async {
    cnt1++;
    // Future.wait(journals);
    await GetupDB.database;
    final data = await SelectWeekData().selectGetups();
    journals.clear();

    for (i = 0; i < data.length; i++) {
      journals.add(data[i]);
    }
  }
}
