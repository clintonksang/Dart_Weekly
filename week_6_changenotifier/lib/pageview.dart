import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_6_changenotifier/basic.dart';
import 'package:week_6_changenotifier/provider/fruit_provider.dart';

import 'fromnetwork.dart';

class Pages extends StatefulWidget {
  const Pages({Key? key}) : super(key: key);

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.square(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            MyHomePage(
                title:
                    'Current fruit+ ${Provider.of<ChangeFruit>(context).fruit}'),
            const Intermediate(title: 'From network'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              activeColor: Colors.red,
              inactiveColor: Colors.grey,
              title: const Text('Item One'),
              icon: Icon(Icons.home)),
          BottomNavyBarItem(
              activeColor: Colors.red,
              inactiveColor: Colors.green,
              title: const Text('Item Two'),
              icon: Icon(Icons.apps)),
          // BottomNavyBarItem(
          //     title: Text('Item Three'), icon: Icon(Icons.chat_bubble)),
        ],
      ),
    );
  }
}
