import 'package:flutter/material.dart';
import 'package:minkatsu/database/create_database.dart';
import 'package:provider/provider.dart';

import 'chart/chart.dart';
import 'timer/timer.dart';
import 'module/db_insert.dart';
import 'module/db_chart.dart';

void main() {
  runApp(const MyApp());
}

void timerins(DateTime daytiem) {}

//テーマ変更用の状態クラス
class MyTheme extends ChangeNotifier {
  ThemeData current = ThemeData.light();
  bool _isDark = false;

  //とりあえずトグルでテーマを切り替える関数だけ定義しています
  toggle() {
    _isDark = !_isDark;
    current = _isDark ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyTheme(),
      child: Consumer<MyTheme>(
        builder: (context, theme, _) {
          return MaterialApp(
            theme: theme.current,
            home: const MyHomePage(title: 'minkatsu'),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> _journals = [];

  bool _isLoading = true;
  // This function is used to fetch all data from the database

  var _selectIndex = 0;

  final _pages = <Widget>[
    const TimerPage(),
    const ChartPage(),
  ];

  void _onTapItem(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        //影
        elevation: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_later),
            label: 'Timer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights),
            label: 'Chart',
          ),
        ],
        currentIndex: _selectIndex,
        onTap: _onTapItem,
      ),
      //ナイトモード切り替え
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.dark_mode),
        onPressed: () {
          Provider.of<MyTheme>(context, listen: false).toggle();
          // DateTime now = DateTime.now();

          // Db_ins(true);
          Db_sec();
          // Db_sec();

          // print("main journals:" "${Db_sec.journals}");
        },
      ),
    );
  }
}
