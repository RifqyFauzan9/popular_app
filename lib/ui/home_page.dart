import 'package:flutter/material.dart';
import 'package:most_popular_applications/ui/liked_app_list.dart';
import 'package:most_popular_applications/ui/app_list.dart';
import 'package:most_popular_applications/ui/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  final List<Widget> _listWidget = [
    const AppListMobile(),
    const LikedAppList(),
    const ProfilePage(),
  ];

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.public),
      label: 'Apps',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Liked'
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Profile',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              body: _listWidget[_bottomNavIndex],
              bottomNavigationBar: BottomNavigationBar(
                items: _bottomNavBarItems,
                onTap: _onBottomNavTapped,
                currentIndex: _bottomNavIndex,
                selectedItemColor: Colors.blue,
              ),
            );
      
  }
}
