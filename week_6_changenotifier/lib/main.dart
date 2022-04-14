import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_6_changenotifier/pageview.dart';
import 'package:week_6_changenotifier/provider/appstate_provider.dart';

import 'provider/fruit_provider.dart';
import 'basic.dart';

void main() {
  runApp(
    MultiProvider(child: const MyApp(), providers: [
      ChangeNotifierProvider(
        create: (context) => ChangeFruit(),
      ),
      ChangeNotifierProvider(
        create: (context) => AppState(),
      ),
    ]),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Pages(
          ),
    );
  }
}
