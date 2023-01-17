import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/model/tasks.dart';
import 'package:todo_application/screen/task_List/TaskItem.dart';
import 'package:todo_application/shared/local/FireBase_Utils.dart';
import 'package:todo_application/shared/styles/MyTheme.dart';
import 'package:todo_application/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../provider/ThemeProvider.dart';

class ListScreen extends StatefulWidget {
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
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
            padding: const EdgeInsets.fromLTRB(45, 80, 45, 0),
            child: Text(AppLocalizations.of(context)!.todolist,
                style: MyThemeData.LightTheme.textTheme.headline1
                    ?.copyWith(fontSize: 30)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: CalendarTimeline(
              initialDate: date,
              firstDate: DateTime.now().subtract(Duration(days: 365)),
              lastDate: DateTime.now().add(Duration(days: 365)),
              onDateSelected: (dateTime) {
                print(date);
                date = dateTime;
                setState(() {});
              },
              leftMargin: 20,
              monthColor: provider.theme == ThemeMode.light
                  ? ColorBlack
                  : ColorWhite,
              dayColor: provider.theme == ThemeMode.light
                  ? ColorBlack
                  : ColorWhite,
              activeDayColor: ColorBlue,
              activeBackgroundDayColor: provider.theme == ThemeMode.light
                  ? ColorWhite
                  : ColorBlack,
              dotsColor: ColorBlue,
              locale: 'en_ISO',
            ),
          ),
          Expanded(
              child: StreamBuilder<QuerySnapshot<Task>>(
            stream: getTaskFromFireStore(date),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text(AppLocalizations.of(context)!.somethingwentwrong));
              }
              var tasks =
                  snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
              return ListView.builder(
                itemBuilder: (context, index) {
                  return TaskItem(tasks[index]);
                },
                itemCount: tasks.length,
              );
            },
          )),
        ],
      ),
    ]);
  }
}
