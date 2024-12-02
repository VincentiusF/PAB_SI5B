import 'package:buttom_navigation/screens/favorite_screen.dart';
import 'package:buttom_navigation/screens/home_screen.dart';
import 'package:buttom_navigation/screens/profile_screen.dart';
import 'package:buttom_navigation/screens/search_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screenOption = <Widget>[
    HomeScreen(),
    SearchSCreen(),
    FavoriteScreen(),
    ProfileScreen()
  ];

  void _onitemtapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenOption.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          // item pertama
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          // item kedua
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          // item pertama
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          // item pertama
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onitemtapped,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.deepPurple.shade200,
      ),
    );
  }
}
