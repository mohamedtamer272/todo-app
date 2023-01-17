import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_application/shared/styles/colors.dart';

void showLoading(String massage, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        actions: [
          Center(child: CircularProgressIndicator()),
          Center(child: Text(massage))
        ],
      );
    },
  );
}

void showMassage(
    String massage, BuildContext context, String posBtn, VoidCallback posAction,
    {String? negBtn, VoidCallback? negAction}) {
  showDialog(
    context: context,
    builder: (context) {
      List<Widget> actions = [
        TextButton(
            onPressed: posAction,
            child: Text(
              posBtn,
              style: TextStyle(color: ColorBlue),
            )),
      ];
      if (negBtn != null) {
        actions.add(TextButton(
            onPressed: negAction,
            child: Text(
              negBtn,
              style: TextStyle(color: ColorBlue),
            )));
      }
      return AlertDialog(
        title: Text(massage ,style: TextStyle(color: ColorBlue),),
        actions: actions,
      );
    },
  );
}

void hideLoading(BuildContext context) {
  Navigator.pop(context);
}
