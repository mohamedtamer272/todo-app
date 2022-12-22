import 'package:flutter/material.dart';
import 'package:todo_application/shared/styles/MyTheme.dart';
import 'package:todo_application/shared/styles/colors.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        height: 120,
        width: 320,
        decoration: BoxDecoration(
          color: ColorWhite,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 70,
                width: 5,
                color: ColorBlue,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 40, 0, 0),
                ),
                Text(
                  'data',
                  style: MyThemeData.LightTheme.textTheme.headline2,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    ),
                    Icon(
                      Icons.access_time_rounded,
                      size: 12,
                    ),
                    Text(
                      '3:25:45',
                      style: MyThemeData.LightTheme.textTheme.headline2
                          ?.copyWith(color: ColorBlack, fontSize: 12),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              width: 90,
            ),
            Container(
              height: 40,
              width: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: ColorBlue),
              child: Icon(
                Icons.done,
                color: ColorWhite,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
