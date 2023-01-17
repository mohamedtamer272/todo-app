import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/model/tasks.dart';
import 'package:todo_application/screen/editTask/EditTask.dart';
import 'package:todo_application/shared/styles/MyTheme.dart';
import 'package:todo_application/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../provider/ThemeProvider.dart';
import '../../shared/local/FireBase_Utils.dart';

class TaskItem extends StatelessWidget {
  Task task;

  TaskItem(this.task);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Slidable(
      startActionPane: ActionPane(motion: DrawerMotion(), children: [
        SlidableAction(
          onPressed: (context) {
            DeleteTaskFromFireStore(task.id);
          },
          icon: Icons.delete,
          label: AppLocalizations.of(context)!.delete,
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
        ),
        SlidableAction(
          onPressed: (context) {
            Navigator.pushNamed(context, EditTask.routeName, arguments: task);
          },
          icon: Icons.edit,
          label: AppLocalizations.of(context)!.edit,
          backgroundColor: ColorBlue,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
        ),
      ]),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          decoration: BoxDecoration(
            color: provider.theme == ThemeMode.light ? ColorWhite : ColorBlack,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                height: 70,
                width: 5,
                color: task.isDone ? ColorGreen : ColorBlue,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style:
                          MyThemeData.LightTheme.textTheme.headline2?.copyWith(
                        fontSize: 20,
                        color: task.isDone ? ColorGreen : ColorBlue,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      task.description,
                      style: MyThemeData.LightTheme.textTheme.headline2
                          ?.copyWith(
                              color: provider.theme == ThemeMode.light
                                  ? ColorBlack
                                  : ColorWhite,
                              fontSize: 15),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {

                },
                child: task.isDone? Container(
                  height: 40,
                  width: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorGreen),
                  child: Text('Done'),
                ) : Container(
                  height: 40,
                  width: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorBlue),
                  child: Icon(
                    Icons.done,
                    color: ColorWhite,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
