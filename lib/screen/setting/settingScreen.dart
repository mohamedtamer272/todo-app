import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todo_application/screen/setting/LanguageBottomSheet.dart';
import 'package:todo_application/screen/setting/ModeBottomSheet.dart';

import '../../shared/styles/MyTheme.dart';
import '../../shared/styles/colors.dart';

class settingScreen extends StatelessWidget {
  const settingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            height: 200,
            width: double.infinity,
            color: ColorBlue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(45, 95, 0, 0),
                  child: Text('Setting',
                      style: MyThemeData.LightTheme.textTheme.headline1
                          ?.copyWith(fontSize: 30)),
                ),
              ],
            )),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Language',
            style: MyThemeData.LightTheme.textTheme.headline1
                ?.copyWith(color: ColorBlack),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            ShowLanguageBottomSheet(context);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            padding: EdgeInsets.all(15),
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorWhite,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(width: 3, color: ColorBlack),
            ),
            child: Text(
                'English',
                style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold )
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Mode',
            style: MyThemeData.LightTheme.textTheme.headline1
                ?.copyWith(color: ColorBlack),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            ShowModeBottomSheet(context);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            padding: EdgeInsets.all(15),
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorWhite,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(width: 3, color: ColorBlack),
            ),
            child: Text(
                'Light',
                style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold )
            ),
          ),
        ),
      ],
    );
  }

  void ShowLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return LanguageBottomSheet();
      },
    );
  }
  void ShowModeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ModeBottomSheet();
      },
    );
  }
}
