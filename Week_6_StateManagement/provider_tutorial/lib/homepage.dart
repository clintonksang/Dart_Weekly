import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/services/change_notifier.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var person = Person('Clinton', 10);
  late int? newage;

  @override
  Widget build(BuildContext context) {
    var providerw = Provider.of<Person>(context);
    var providerf = Provider.of<Person>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              "${providerw.age}",
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => providerf.subtractAge(),
          tooltip: 'Increment',
          child: const Icon(Icons.remove)),
    );
  }
}
