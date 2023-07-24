import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:gnexus/services/language/lang_json.dart';
import 'package:gnexus/services/routes/app_routes.dart';

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
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      debugShowCheckedModeBanner: false,
      title: 'Gnexus',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MainNavigator(),
    );
  }
}


