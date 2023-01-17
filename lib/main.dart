import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/layout/HomeLayout.dart';
import 'package:todo_application/provider/LanguageProvider.dart';
import 'package:todo_application/provider/ThemeProvider.dart';
import 'package:todo_application/screen/editTask/EditTask.dart';
import 'package:todo_application/shared/styles/MyTheme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);
    var themeprovider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale(provider.language),
      debugShowCheckedModeBanner: false,
      title: 'MyApp',
      initialRoute: HomeLayout.routeName,
      routes: {HomeLayout.routeName: (c) => HomeLayout(),
        EditTask.routeName: (c) => EditTask()},
      theme: MyThemeData.LightTheme,
      darkTheme: MyThemeData.DarkTheme,
      themeMode: themeprovider.theme,

    );
  }
}
