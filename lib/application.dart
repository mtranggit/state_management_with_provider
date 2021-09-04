import 'package:flutter/material.dart';
import 'package:state_management_with_provider/screens/faves_screen.dart';
import 'package:state_management_with_provider/screens/films_screen.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int _selectedIndex = 0;
  final _appBarTitles = [
    Text('Films'),
    Text('Faves'),
  ];
  var _appBarTitleText = Text('Films');

  final _pageOptions = [
    FilmsScreen(),
    FavesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trilogies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: _appBarTitleText),
        body: _pageOptions[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
              _appBarTitleText = _appBarTitles[index];
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'Films',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Faves',
            ),
          ],
        ),
      ),
    );
  }
}
