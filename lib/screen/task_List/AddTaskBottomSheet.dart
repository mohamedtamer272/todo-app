import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/model/tasks.dart';
import 'package:todo_application/shared/components/ui_utils.dart';
import 'package:todo_application/shared/local/FireBase_Utils.dart';
import 'package:todo_application/shared/styles/MyTheme.dart';
import 'package:todo_application/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../provider/ThemeProvider.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var TitleController = TextEditingController();

  var DescriptionController = TextEditingController();
  DateTime selectedData = DateTime.now();

  GlobalKey<FormState> FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Container(
      color:
          provider.theme == ThemeMode.light ? LightColorGreen : DarkColorBlack,
      height: MediaQuery.of(context).size.height * .65,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(AppLocalizations.of(context)!.addnewtask,
                  style: MyThemeData.LightTheme.textTheme.headline1?.copyWith(
                    color: provider.theme == ThemeMode.light
                        ? ColorBlack
                        : ColorWhite,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: FormKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (Text) {
                        if (Text != null && Text.isEmpty) {
                          return AppLocalizations.of(context)!
                              .pleaseentertasktitle;
                        }
                        return null;
                      },
                      controller: TitleController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: provider.theme == ThemeMode.light
                              ? ColorWhite
                              : ColorBlue,
                          label: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              AppLocalizations.of(context)!.title,
                              style: MyThemeData.LightTheme.textTheme.headline1
                                  ?.copyWith(
                                color: provider.theme == ThemeMode.light
                                    ? ColorBlack
                                    : ColorWhite,
                              ),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: provider.theme == ThemeMode.light
                                  ? ColorBlack
                                  : ColorWhite,
                              width: 2.0,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (Text) {
                        if (Text != null && Text.isEmpty) {
                          return AppLocalizations.of(context)!
                              .pleaseentertaskdescription;
                        }
                        return null;
                      },
                      controller: DescriptionController,
                      maxLines: 4,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: provider.theme == ThemeMode.light
                              ? ColorWhite
                              : ColorBlue,
                          label: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              AppLocalizations.of(context)!.description,
                              style: MyThemeData.LightTheme.textTheme.headline1
                                  ?.copyWith(
                                color: provider.theme == ThemeMode.light
                                    ? ColorBlack
                                    : ColorWhite,
                              ),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: provider.theme == ThemeMode.light
                                  ? ColorBlack
                                  : ColorWhite,
                              width: 2.0,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(AppLocalizations.of(context)!.selectdate,
                      style:
                          MyThemeData.LightTheme.textTheme.headline1?.copyWith(
                        color: provider.theme == ThemeMode.light
                            ? ColorBlack
                            : ColorWhite,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      SelectDate();
                    },
                    child: Text(
                        "${selectedData.day}/${selectedData.month}/${selectedData.year}",
                        textAlign: TextAlign.center,
                        style: MyThemeData.LightTheme.textTheme.headline1
                            ?.copyWith(
                          color: provider.theme == ThemeMode.light
                              ? ColorBlack
                              : ColorWhite,
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 40,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  if (FormKey.currentState!.validate()) {
                    Task task = Task(
                        title: TitleController.text,
                        description: DescriptionController.text,
                        date: DateUtils.dateOnly(selectedData)
                            .microsecondsSinceEpoch);
                    showLoading(AppLocalizations.of(context)!.loading, context);
                    addTaskToFireStore(task).then((value) {
                      hideLoading(context);
                      showMassage(
                          AppLocalizations.of(context)!.taskaddsuccessfuly,
                          context,
                          AppLocalizations.of(context)!.ok, () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                          negBtn: AppLocalizations.of(context)!.cancel,
                          negAction: () {});
                    }).catchError((error) {});
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text(AppLocalizations.of(context)!.addtask,
                    style: MyThemeData.LightTheme.textTheme.headline1?.copyWith(
                      color: ColorWhite,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void SelectDate() async {
    DateTime? chosenDay = await showDatePicker(
      context: context,
      initialDate: selectedData,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 365),
      ),
    );
    if (chosenDay == null) return;
    selectedData = DateUtils.dateOnly(chosenDay);
    setState(() {});
  }
}
