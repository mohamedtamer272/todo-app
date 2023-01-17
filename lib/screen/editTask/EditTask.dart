import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/tasks.dart';
import '../../provider/ThemeProvider.dart';
import '../../shared/components/ui_utils.dart';
import '../../shared/local/FireBase_Utils.dart';
import '../../shared/styles/MyTheme.dart';
import '../../shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditTask extends StatefulWidget {
  static const String routeName = 'EditTask';

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  DateTime selectedData = DateTime.now();

  GlobalKey<FormState> FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Task todo = ModalRoute.of(context)!.settings.arguments as Task;
    var TitleController = TextEditingController(text: todo.title);
    var DescriptionController = TextEditingController(text: todo.description);
    var provider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor:
          provider.theme == ThemeMode.light ? LightColorGreen : DarkColorBlack,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: ColorBlue,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(45, 95, 45, 0),
                child: Text(AppLocalizations.of(context)!.edittask,
                    style: MyThemeData.LightTheme.textTheme.headline1
                        ?.copyWith(fontSize: 30)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 150, 50, 0),
              child: Container(
                height: 550,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: provider.theme == ThemeMode.light
                      ? ColorWhite
                      : ColorBlack,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: FormKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (Text) {
                            if (Text != null && Text.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .pleaseentertasktitle;
                            }
                            return null;
                          },
                          onChanged: (value) {
                            var TaskEdit = value;
                            todo.title = TaskEdit;
                          },
                          controller: TitleController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: provider.theme == ThemeMode.light
                                  ? LightColorGreen
                                  : ColorBlue,
                              label: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Text(
                                  AppLocalizations.of(context)!.title,
                                  style: MyThemeData
                                      .LightTheme.textTheme.headline1
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
                          onChanged: (value) {
                            var TaskEdit = value;
                            todo.description = TaskEdit;
                          },
                          controller: DescriptionController,
                          maxLines: 4,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: provider.theme == ThemeMode.light
                                  ? LightColorGreen
                                  : ColorBlue,
                              label: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Text(
                                  AppLocalizations.of(context)!.description,
                                  style: MyThemeData
                                      .LightTheme.textTheme.headline1
                                      ?.copyWith(
                                          color:
                                              provider.theme == ThemeMode.light
                                                  ? ColorBlack
                                                  : ColorWhite),
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
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(AppLocalizations.of(context)!.selectdate,
                                  style: MyThemeData
                                      .LightTheme.textTheme.headline1
                                      ?.copyWith(
                                          color:
                                              provider.theme == ThemeMode.light
                                                  ? ColorBlack
                                                  : ColorWhite)),
                              SizedBox(
                                height: 30,
                              ),
                              InkWell(
                                onTap: () {
                                  onChanged:
                                  (value) {
                                    var TaskEdit = value;
                                    todo.date = TaskEdit;
                                  };
                                  SelectDate();
                                },
                                child: Text(
                                    "${selectedData.day}/${selectedData.month}/${selectedData.year}",
                                    textAlign: TextAlign.center,
                                    style: MyThemeData
                                        .LightTheme.textTheme.headline1
                                        ?.copyWith(
                                            color: provider.theme ==
                                                    ThemeMode.light
                                                ? ColorBlack
                                                : ColorWhite)),
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
                                showLoading(
                                    AppLocalizations.of(context)!.loading,
                                    context);
                                EditTaskFromFireStore(todo).then((value) {
                                  hideLoading(context);
                                  showMassage(
                                      AppLocalizations.of(context)!
                                          .taskeditsuccessfuly,
                                      context,
                                      AppLocalizations.of(context)!.ok, () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                      negBtn:
                                          AppLocalizations.of(context)!.cancel,
                                      negAction: () {});
                                }).catchError((error) {});
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorBlue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            child: Text(AppLocalizations.of(context)!.edittask,
                                style:
                                    MyThemeData.LightTheme.textTheme.headline1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
