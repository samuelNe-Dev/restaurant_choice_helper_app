import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_choice_helper_app/widgets/favorites_carousel.dart';
import 'package:restaurant_choice_helper_app/widgets/restaurant_carousel.dart';

class GenerelHomeScreen extends StatefulWidget {
  const GenerelHomeScreen({Key? key}) : super(key: key);

  @override
  _GenerelHomeScreenState createState() => _GenerelHomeScreenState();
}

class _GenerelHomeScreenState extends State<GenerelHomeScreen> {
  int _selectedIcon = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.globeAsia,
    FontAwesomeIcons.hamburger,
    FontAwesomeIcons.pizzaSlice,
    FontAwesomeIcons.drumstickBite,
    FontAwesomeIcons.carrot,
  ];
  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIcon = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIcon == index
              ? Theme.of(context).primaryColorLight
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          color: _selectedIcon == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'Wo möchtest du gerne essen?',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _icons
                    .asMap()
                    .entries
                    .map((MapEntry map) => _buildIcon(map.key))
                    .toList()),
            SizedBox(height: 20.0),
            RestaurantCarousel(),
            FavoriteCarousel()
          ],
        ),
      );
  }
}
