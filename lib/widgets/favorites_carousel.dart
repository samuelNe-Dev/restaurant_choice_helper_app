import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_choice_helper_app/models/restaurant_model.dart';
import 'package:restaurant_choice_helper_app/screens/restaurant/restaurant_screen.dart';

import '../constants.dart';

class FavoriteCarousel extends StatelessWidget {
  const FavoriteCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Perfekt für dich',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    )),
                GestureDetector(
                  onTap: () => print('Alle anzeigen'),
                  child: Text('Alle anzeigen',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5)),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                left: defaultPadding,
                bottom: defaultPadding * 2.5,
              ),
              height: size.width * 0.6,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: favourites.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RestaurantScreen(restaurant: favourites[index],)));
                        },
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              top: defaultPadding,
                              left: defaultPadding,
                              right: defaultPadding,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0)),
                              child: Image.asset(
                                favourites[index].imageUrl,
                                fit:  BoxFit.cover,
                                width: size.width * 0.4,
                                height: size.width * 0.4,
                              ),
                            ),
                          ),
                          Container(
                            width: size.width * 0.4,
                            padding: EdgeInsets.all(defaultPadding / 2),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.1)),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0))),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  favourites[index].name,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.mapMarkerAlt,
                                              size: 13,
                                              color: Colors.grey[600],
                                            ),
                                            Text(
                                              favourites[index].city,
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey[600]),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        favourites[index].distance.toString() +
                                            " km",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
