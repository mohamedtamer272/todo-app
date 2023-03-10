import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/screen/setting/settingScreen.dart';
import 'package:todo_application/screen/task_List/AddTaskBottomSheet.dart';
import 'package:todo_application/screen/task_List/listScreen.dart';
import 'package:todo_application/shared/styles/colors.dart';

import '../provider/ThemeProvider.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          provider.theme == ThemeMode.light ? LightColorGreen : DarkColorBlack,
      body: tabs[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
            side: BorderSide(
                color: provider.theme == ThemeMode.light
                    ? ColorWhite
                    : ColorBlue,
                width: 4)),
        onPressed: () {
          showAddTaskBottomSheet();
        },
        child: Icon(
          Icons.add,
          color: ColorWhite,
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomAppBar(
          color: provider.theme == ThemeMode.light
              ? ColorWhite
              : ColorBlack,
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: BottomNavigationBar(
                currentIndex: currentIndex,
                onTap: (index) {
                  currentIndex = index;
                  setState(() {});
                },
                backgroundColor: Colors.transparent,
                elevation: 0,
                items: [
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/image/icon_list.png")),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                          AssetImage("assets/image/icon_settings.png")),
                      label: '')
                ]),
          ),
        ),
      ),
    );
  }

  List<Widget> tabs = [
    ListScreen(),
    settingScreen(),
  ];

  void showAddTaskBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(child: AddTaskBottomSheet());
      },
    );
  }
}
