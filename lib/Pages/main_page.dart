import 'dart:convert';

import 'package:BundEllerBosse/Models/Games.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'NavBarWidget/games_library_widget.dart';
import 'NavBarWidget/home_page_widget.dart';
import 'NavBarWidget/settings_widget.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _currentIndex = 1;
  final List<Widget> _children = [
    GamesLibraryWidget(),
    HomePageWidget(),
    SettingsWidget()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          automaticallyImplyLeading: true,
          title: Text("Bund Eller Bøsse"),
        ),
        body: Stack(children: <Widget>[
          _children[_currentIndex],
        ],
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
        bottomNavigationBar: FancyBottomNavigation(
          tabs:[
            TabData(iconData:Icons.gamepad, title: "Mange Bajer"),
            TabData(iconData: Icons.access_time, title: "Bajer"),
            TabData(iconData: Icons.settings, title: "Indstillinger")
          ],
          onTabChangedListener: (int position) {
            setState(() {
              _currentIndex = position;
            });
          },
          initialSelection: 1,
          circleColor: Colors.orange,
        )
    );
  }
}

