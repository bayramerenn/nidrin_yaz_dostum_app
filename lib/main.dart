import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nidrin_yaz_dostum_app/pages/choose_seconds.dart';
import 'package:nidrin_yaz_dostum_app/pages/home.dart';
import 'package:nidrin_yaz_dostum_app/util/app_constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppConstant.colorPrimary,
      ),
    );
    return MaterialApp(
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        // TODO: uncomment the line below after codegen
        // AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        // const Locale('tr', ''),
        const Locale.fromSubtags(languageCode: 'zh'),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Yaz Dostum',
      theme: ThemeData(
        primarySwatch: AppConstant.kPrimarySwatch,
      ),
      initialRoute: AppConstant.pageSplash,
      routes: {
        AppConstant.pageSplash: (context) => HomePage(),
        AppConstant.pageChooseSecond: (context) => ChooseSeconds()
      },
      // home: ChooseSeconds(),
    );
  }
}
