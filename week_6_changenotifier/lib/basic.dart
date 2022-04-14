import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/fruit_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Fruit(
              fruit: 'Apple',
            ),
            Fruit(
              fruit: 'Banana',
            ),
            Fruit(
              fruit: 'Cherry',
            ),
          ],
        ),
      ),
    );
  }
}

class Fruit extends StatefulWidget {
  final String? fruit;

  const Fruit({
    Key? key,
    this.fruit,
  }) : super(key: key);

  @override
  State<Fruit> createState() => _FruitState();
}

class _FruitState extends State<Fruit> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Provider.of<ChangeFruit>(context, listen: false)
                  .changeFruit(widget.fruit ?? '');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 130,
                height: 70,
                color: Colors.red,
                child: Center(child: Text(widget.fruit ?? "null")),
              ),
            ),
          )
        ],
      ),
    );
  }
}
