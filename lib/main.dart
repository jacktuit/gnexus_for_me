import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gnexus/services/language/lang_json.dart';
import 'package:gnexus/services/routes/app_routes.dart';
import 'package:gnexus/utils/utils_variable/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upgrader/upgrader.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
        Locale('uz'),
      ],

      path: 'assets/lang',
      assetLoader: JsonAssetLoader(),
      fallbackLocale: const Locale('uz'),

      child: const MyApp(),
    ),

  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    getLoginIn();
    super.initState();
  }
  void getLoginIn()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    UtilsVariables.accessToken = prefs.getString('accessToken') ?? "";

  }
  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      upgrader: Upgrader(

          canDismissDialog: true,
          shouldPopScope: ()=>true,
          durationUntilAlertAgain: Duration(days: 1),
          dialogStyle:Platform. isIOS? UpgradeDialogStyle.cupertino:UpgradeDialogStyle.material
      ),
      child: MaterialApp(
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        title: 'Gnexus',
        theme: ThemeData(

          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  MainNavigator(),
      ),
    );
  }
}


