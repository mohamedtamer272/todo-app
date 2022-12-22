import 'package:flutter/material.dart';
import 'package:todo_application/model/tasks.dart';
import 'package:todo_application/shared/local/FireBase_Utils.dart';
import 'package:todo_application/shared/styles/MyTheme.dart';
import 'package:todo_application/shared/styles/colors.dart';

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
    return Container(
      height: MediaQuery.of(context).size.height * .65,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Add New Task',
                  style: MyThemeData.LightTheme.textTheme.headline1
                      ?.copyWith(color: ColorBlack)),
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
                          return 'Please Enter Task Title';
                        }
                        return null;
                      },
                      controller: TitleController,
                      decoration: InputDecoration(
                          label: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              'Title',
                              style: MyThemeData.LightTheme.textTheme.headline1
                                  ?.copyWith(color: ColorBlack),
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
                              color: ColorBlack,
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
                          return 'Please Enter Task Description';
                        }
                        return null;
                      },
                      controller: DescriptionController,
                      maxLines: 4,
                      decoration: InputDecoration(
                          label: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              'Description',
                              style: MyThemeData.LightTheme.textTheme.headline1
                                  ?.copyWith(color: ColorBlack),
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
                              color: ColorBlack,
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
                  Text('Select Date',
                      style: MyThemeData.LightTheme.textTheme.headline1
                          ?.copyWith(color: ColorBlack)),
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
                            ?.copyWith(color: ColorBlack)),
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
                        date: selectedData.microsecondsSinceEpoch);
                    addTaskToFireStore(task);
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text('Add Task',
                    style: MyThemeData.LightTheme.textTheme.headline1),
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
    if(chosenDay== null)return;
    selectedData=chosenDay;
    setState(() {

    });
  }
}
