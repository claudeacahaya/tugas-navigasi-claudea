import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'home.dart';
import 'message.dart';
import 'profile.dart';
import 'settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Navigation Bottom Bar',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Dashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  bool _showMoonIcon = true;

  final _iconList = <IconData>[
    Icons.home_outlined,
    Icons.message_outlined,
    Icons.person_outline,
    Icons.settings_outlined,
  ];

  final _titles = ['Home', 'Message', 'Profile', 'Settings'];

  final _pages = [
    HomePage(),
    MessagePage(),
    ProfilePage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        backgroundColor: Colors.pink,
      ),
      body: _pages[_currentIndex],
      floatingActionButton: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(child: child, scale: animation);
        },
        child: _showMoonIcon
            ? FloatingActionButton(
                key: ValueKey('moon_visible'),
                backgroundColor: Colors.pink,
                child: const Icon(Icons.brightness_3, color: Colors.white),
                onPressed: () {
                  setState(() {
                    _showMoonIcon = false;
                  });
                  Future.delayed(Duration(seconds: 2), () {
                    if (mounted) {
                      setState(() {
                        _showMoonIcon = true;
                      });
                    }
                  });
                },
              )
            : SizedBox.shrink(),
      ),
      floatingActionButtonLocation: _showMoonIcon
          ? FloatingActionButtonLocation.centerDocked
          : FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: _iconList,
        activeIndex: _currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        backgroundColor: Colors.black87,
        activeColor: Colors.pinkAccent,
        inactiveColor: Colors.white54,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
