import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/screen/setting/LanguageBottomSheet.dart';
import 'package:todo_application/screen/setting/ModeBottomSheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../provider/LanguageProvider.dart';
import '../../provider/ThemeProvider.dart';
import '../../shared/styles/MyTheme.dart';
import '../../shared/styles/colors.dart';

class settingScreen extends StatelessWidget {
  const settingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);
    var themeprovider = Provider.of<ThemeProvider>(context);
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
                  padding: const EdgeInsets.fromLTRB(45, 95, 45, 0),
                  child: Text(AppLocalizations.of(context)!.setting,
                      style: MyThemeData.LightTheme.textTheme.headline1
                          ?.copyWith(fontSize: 30)),
                ),
              ],
            )),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
          child: Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.headline1?.copyWith(
                color: themeprovider.theme == ThemeMode.light
                    ? ColorBlack
                    : ColorWhite,
                fontSize: 30),
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
              border: Border.all(
                width: 3,
                color: themeprovider.theme == ThemeMode.light
                    ? ColorBlack
                    : ColorBlue,
              ),
            ),
            child: Text(
              provider.language == 'en'
                  ? AppLocalizations.of(context)!.english
                  : AppLocalizations.of(context)!.arabic,
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontSize: 20,
                    color: ColorBlack,
                  ),
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
          child: Text(
            themeprovider.theme == ThemeMode.dark
                ? AppLocalizations.of(context)!.dark
                : AppLocalizations.of(context)!.light,
            style: Theme.of(context).textTheme.headline1?.copyWith(
                color: themeprovider.theme == ThemeMode.light
                    ? ColorBlack
                    : ColorWhite,
                fontSize: 30),
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
              border: Border.all(width: 3, color: themeprovider.theme == ThemeMode.light
                  ? ColorBlack
                  : ColorBlue,),
            ),
            child: Text(
              themeprovider.theme == ThemeMode.light
                  ? AppLocalizations.of(context)!.light
                  : AppLocalizations.of(context)!.dark,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(color: ColorBlack, fontSize: 20),
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
