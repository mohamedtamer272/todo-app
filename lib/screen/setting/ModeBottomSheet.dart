import 'package:flutter/material.dart';
import 'package:todo_application/shared/styles/MyTheme.dart';
import 'package:todo_application/shared/styles/colors.dart';

class ModeBottomSheet extends StatelessWidget {
  const ModeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorWhite,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(width: 3, color: ColorBlue),
      ),
      margin: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {},
              child: LanguageItem(context,"Light",true)),
          SizedBox(
            height: 30,
          ),
          InkWell(onTap: () {}, child: LanguageItem(context,"Dark",true)),
        ],
      ),
    );
  }
  Widget LanguageItem(BuildContext context, String text, bool IsSelected) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: MyThemeData.LightTheme.textTheme.headline1
                ?.copyWith(color: IsSelected ? ColorBlue : ColorBlack,),
          ),
          Icon(Icons.done,
              color: IsSelected ? ColorBlue :ColorBlack )
        ],
      );
  }

