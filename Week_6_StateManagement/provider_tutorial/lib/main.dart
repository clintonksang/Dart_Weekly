import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/homepage.dart';
import 'package:provider_tutorial/services/change_notifier.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Person('Clinton', 50),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Provider Demo'),
    );
  }
}
