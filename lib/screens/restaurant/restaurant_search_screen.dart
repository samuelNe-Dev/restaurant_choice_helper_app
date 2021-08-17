import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_choice_helper_app/models/restaurant_model.dart';
import 'package:restaurant_choice_helper_app/screens/restaurant/restaurant_screen.dart';

class RestaurantSearchScreen extends StatefulWidget {
  const RestaurantSearchScreen({Key? key}) : super(key: key);

  @override
  _RestaurantSearchScreenState createState() => _RestaurantSearchScreenState();
}

class _RestaurantSearchScreenState extends State<RestaurantSearchScreen> {
  String _searchedTerm = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 80.0),
              child: Text(
                'Auf was genau hast du heute Lust?',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 80.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _searchedTerm = value;
                  });
                },
                style: TextStyle(fontSize: 22),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFE7EBEE),
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                Restaurant restaurant = restaurants[index];
                if (_searchedTerm != "") {
                  if ((restaurant.name.toLowerCase() ==
                          _searchedTerm.toLowerCase()) ||
                      (restaurant.type.toLowerCase() ==
                          _searchedTerm.toLowerCase()) ||
                      (restaurant.name
                          .toLowerCase()
                          .contains(_searchedTerm.toLowerCase())) ||
                      (restaurant.type
                          .toLowerCase()
                          .contains(_searchedTerm.toLowerCase()))) {
                    return SearchTile(index: index);
                  } else {
                    return Container();
                  }
                } else {
                  return SearchTile(index: index);
                }
                //  SearchTile(index: index);
              },
            )
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget SearchTile({required int index}) {
    Restaurant restaurant = restaurants[index];
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RestaurantScreen(
                  restaurant: restaurants[index],
                )),
      ),
      child: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Hero(
                    tag: restaurants[index].imageUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        restaurant.imageUrl,
                        fit: BoxFit.cover,
                        width: size.width * 0.2,
                        height: size.width * 0.2,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 0.3))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            restaurant.name,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            restaurant.description,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 13.0,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.mapMarkerAlt,
                                size: 13,
                                color: Colors.grey[600],
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                restaurant.city,
                                style: TextStyle(fontSize: 13.0),
                              ),
                            ],
                          ),
                          Text(
                            "ca. " + restaurant.distance.toString() + " km",
                            style: TextStyle(fontSize: 13.0),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
