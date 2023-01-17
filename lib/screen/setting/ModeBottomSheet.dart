import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/shared/styles/MyTheme.dart';
import 'package:todo_application/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../provider/ThemeProvider.dart';

class ModeBottomSheet extends StatelessWidget {
  const ModeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ThemeProvider>(context);
    var themeprovider = Provider.of<ThemeProvider>(context);
    return Container(
      color: themeprovider.theme == ThemeMode.light
          ? LightColorGreen
          : ColorBlack,
      child: Container(
        padding: EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: themeprovider.theme == ThemeMode.light
              ? ColorWhite
              : DarkColorBlack,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(width: 3, color: ColorBlue),
        ),
        margin: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
                onTap: () {
                  prov.notifyListener(ThemeMode.light);
                  Navigator.pop(context);
                },
                child: ModeItem(context, AppLocalizations.of(context)!.light,
                    prov.theme == ThemeMode.light)),
            SizedBox(
              height: 30,
            ),
            InkWell(
                onTap: () {
                  prov.notifyListener(ThemeMode.dark);
                  Navigator.pop(context);
                },
                child: ModeItem(
                    context, AppLocalizations.of(context)!.dark,
                    prov.theme == ThemeMode.dark)),
          ],
        ),
      ),
    );
  }
}

  Widget ModeItem(BuildContext context, String text, bool IsSelected) {
    var provider = Provider.of<ThemeProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: MyThemeData.LightTheme.textTheme.headline1?.copyWith(
            color: IsSelected ? ColorBlue : provider.theme == ThemeMode.light
                ? ColorBlack
                : ColorWhite,
          ),
        ),
        Icon(
          Icons.done,
          color: IsSelected
              ? ColorBlue
              : provider.theme == ThemeMode.light
              ? ColorWhite
              : DarkColorBlack,
        )
      ],
    );
  }
