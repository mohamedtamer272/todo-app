import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_application/screen/task_List/TaskItem.dart';
import 'package:todo_application/shared/styles/MyTheme.dart';
import 'package:todo_application/shared/styles/colors.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 200,
        width: double.infinity,
        color: ColorBlue,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(45, 80, 0, 0),
            child: Text('To Do List',
                style: MyThemeData.LightTheme.textTheme.headline1
                    ?.copyWith(fontSize: 30)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: CalendarTimeline(
              initialDate: DateTime.now(),
              firstDate: DateTime.now().subtract(Duration(days: 365)),
              lastDate: DateTime.now().add(Duration(days: 365)),
              onDateSelected: (date) => print(date),
              leftMargin: 20,
              monthColor: ColorBlack,
              dayColor: ColorBlack,
              activeDayColor: ColorBlue,
              activeBackgroundDayColor: ColorWhite,
              dotsColor: ColorBlue,
              locale: 'en_ISO',
            ),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return TaskItem();
            }, itemCount: 15,),
          ),
        ],
      ),
    ]);
  }
}
