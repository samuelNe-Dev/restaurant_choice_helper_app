import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_choice_helper_app/models/restaurant_model.dart';
import 'package:restaurant_choice_helper_app/models/restaurant_meal_model.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;
  const RestaurantScreen({Key? key, required this.restaurant})
      : super(key: key);

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    String _searchedTerm = "";
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: AssetImage(this.widget.restaurant.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.65),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            FontAwesomeIcons.arrowLeft,
                          ),
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.restaurant.name,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.restaurant.description,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Standort",
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(widget.restaurant.street,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300)),
                      SizedBox(
                        height: 0,
                      ),
                      Text(widget.restaurant.city,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300)),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Öffnungszeiten",
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text("Montag - Samstag: ",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w300)),
                          Text(widget.restaurant.openMondayTillSaturday,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w300))
                        ],
                      ),
                      Row(
                        children: [
                          Text("Sonntag: ",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w300)),
                          Text(widget.restaurant.openSunday,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w300))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _searchedTerm = value;
                        });
                      },
                      style: TextStyle(fontSize: 15),
                      decoration: InputDecoration(
                        hintText: "Was willst du essen?",
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
                  MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: this.widget.restaurant.meals.length,
                        itemBuilder: (context, index) {
                          RestaurantMeal meal = this.widget.restaurant.meals[index];
                          if (_searchedTerm != "") {
                            if ((meal.name ==
                                    _searchedTerm.toLowerCase()) ||
                                (meal.type.toLowerCase() ==
                                    _searchedTerm.toLowerCase()) ||
                                (meal.name
                                    .toLowerCase()
                                    .contains(_searchedTerm.toLowerCase())) ||
                                (meal.type
                                    .toLowerCase()
                                    .contains(_searchedTerm.toLowerCase()))) {
                              return SearchTile(
                                  context: context, meal: meal);
                            } else {
                              return Container();
                            }
                          } else {
                            return SearchTile(
                                context: context, meal: meal);
                          }
                          //  SearchTile(index: index);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget SearchTile(
      {required BuildContext context, required RestaurantMeal meal}) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                  width: size.width * 0.2,
                  height: size.width * 0.2,
                ),
              ),
              SizedBox(width: 30),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Colors.grey, width: 0.3))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meal.name,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        meal.price,
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
                            meal.type,
                            style: TextStyle(fontSize: 13.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
