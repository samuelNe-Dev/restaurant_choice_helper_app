import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_choice_helper_app/screens/home_generell_tab_screen.dart';
import 'package:restaurant_choice_helper_app/screens/restaurant/restaurant_search_screen.dart';
import 'package:restaurant_choice_helper_app/widgets/favorites_carousel.dart';
import 'package:restaurant_choice_helper_app/widgets/restaurant_carousel.dart';

import 'profile/current_user_profile_screen.dart';
import 'invite/invite_friend_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;

  List <Widget> _screens = [
    GenerelHomeScreen(),
    RestaurantSearchScreen(),
    InviteFriendScreen(),
    CurrentUserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentTab],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        currentIndex: _currentTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_restaurant,
              size: 30.0,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30.0,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                _currentTab == 2 ? Icons.person_add_outlined : Icons.person_add,
                size: 30.0,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                _currentTab == 3 ? Icons.person_outline_outlined : Icons.person,
                size: 30.0,
              ),
              label: ""),
        ],
      ),
    );
  }
}
