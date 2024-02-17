import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/pages/home_page.dart';
import 'package:weatherapp/splash_screen/splash_screen.dart';

import 'model/setting_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
    '/': (context) => SplashScreen(
      child: HomePage(),
    )
          //child:
    },
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

