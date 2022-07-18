import 'package:flutter/material.dart';
import 'package:minkatsu/database/create_database.dart';
import 'package:minkatsu/module/db_chart.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  @override
  Widget build(BuildContext context) {
    print(Db_sec.journals);
    return const Center(
      child: Text("グラフ"),
    );
    // print(Db_sec.journals);
  }
}
