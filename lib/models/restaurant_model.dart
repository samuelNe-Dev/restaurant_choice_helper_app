import 'package:flutter/material.dart';
import 'package:restaurant_choice_helper_app/models/restaurant_meal_model.dart';

class Restaurant {
  String imageUrl;
  String name;
  String type;
  String city;
  String street;
  String description;
  double distance;
  String openMondayTillSaturday;
  String openSunday;
  List<RestaurantMeal> meals = [];

  Restaurant(
      {required this.imageUrl,
      required this.name,
      required this.type,
      required this.city,
      required this.street,
      required this.description,
      required this.distance,
      required this.openMondayTillSaturday,
      required this.openSunday,
      required this.meals});
}

List<Restaurant> restaurants = [
  Restaurant(
    imageUrl: 'assets/images/jamys_burger.jpg',
    name: 'Jamys Burger',
    type: 'Burger',
    city: "Frankfurt",
    street: "Teststr. 100",
    description:
        "Bei JAMY'S gibt es Burger aus Angus-Rindfleisch, Veggie Burger, Chicken Burger, Fries, Salate und Desserts.",
    distance: 3.1,
    openMondayTillSaturday: "11:30 - 22:00",
    openSunday: "10:00 - 23:30",
    meals: [RestaurantMeal(imageUrl: "assets/images/jamys_cheeseburger.jpg", name: "Cheeseburger", type: "Burger", price: "9,80")],
  ),
  Restaurant(
    imageUrl: 'assets/images/blockhouse.jpg',
    name: 'Blockhouse',
    type: 'Steak',
    city: "Frankfurt",
    street: "Teststr. 100",
    description:
        "Mit dem ersten Block House in Hamburg fing 1968 alles an. Mittlerweile verwöhnen wir unsere Gäste europaweit in 50 Restaurants mit Steaks.",
    distance: 0.4,
    openMondayTillSaturday: "11:30 - 22:00",
    openSunday: "10:00 - 23:30",
    meals: []
  ),
  Restaurant(
    imageUrl: 'assets/images/heidi_und_paul.jpg',
    name: 'Heidi und Paul',
    type: 'Salat',
    city: "Frankfurt",
    street: "Teststr. 100",
    description: "Täglich frische, individuelle Salate und Wraps.",
    distance: 1.6,
    openMondayTillSaturday: "11:30 - 22:00",
    openSunday: "10:00 - 23:30",
    meals: []
  ),
];

List<Restaurant> favourites = [
  Restaurant(
    imageUrl: 'assets/images/shellys_burger.jpg',
    name: "Shelly's Burger",
    type: 'Burger',
    city: "Frankfurt",
    street: "Teststr. 100",
    description:
        "Mit „Shelly's Burger & Falafel“ kommen nun die Burger zurück auf die untere Berger.",
    distance: 0.2,
    openMondayTillSaturday: "11:30 - 22:00",
    openSunday: "10:00 - 23:30",
    meals: []
  ),
  Restaurant(
    imageUrl: 'assets/images/heidi_und_paul.jpg',
    name: 'Heidi und Paul',
    type: 'Salat',
    city: "Frankfurt",
    street: "Teststr. 100",
    description: "Täglich frische, individuelle Salate und Wraps.",
    distance: 1.6,
    openMondayTillSaturday: "11:30 - 22:00",
    openSunday: "10:00 - 23:30",
    meals: []
  ),
];
