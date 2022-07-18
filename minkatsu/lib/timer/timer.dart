import 'package:flutter/material.dart';
import 'package:minkatsu/module/db_chart.dart';
import '../module/db_insert.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  //時間入力用
  TimeOfDay? selectedTime;

  //時間
  dynamic dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //起きる時間
            Text("${dateTime.hour}時${dateTime.minute}分"),
            ElevatedButton(
              onPressed: () {
                _timePicker(context);
                var Dbns1 = Db_ins(false, 1, "on");
              },
              child: const Text("時刻を選択"),
            )
          ],
        ),
      ),
    );
  }

  //時間入力
  _timePicker(BuildContext context) async {
    final TimeOfDay? timePicked = await showTimePicker(
      context: context,
      initialTime: dateTime,
    );
    if (timePicked != null && timePicked != dateTime) {
      setState(() {
        dateTime = timePicked;
      });
    }
  }
}
