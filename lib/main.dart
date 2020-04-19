import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notifier/auth_notifier.dart';
import 'notifier/food_notifier.dart';
import 'screens/feed.dart';
import 'screens/login.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (context) => AuthNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => FoodNotifier(),
        ),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.lightBlue,
      ),
      home: Consumer<AuthNotifier>(
        builder: (context, notifier, child) {
          return notifier.user != null ? Feed() : Login();
        },
      ),
    );
  }
}
