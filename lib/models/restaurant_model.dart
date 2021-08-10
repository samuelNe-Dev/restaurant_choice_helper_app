import 'package:flutter/material.dart';

class Restaurant {
  String imageUrl;
  String name;
  String type;
  String city;
  String description;
  double distance;

  Restaurant({
    required this.imageUrl,
    required this.name,
    required this.type,
    required this.city,
    required this.description,
    required this.distance,
  });
}

List<Restaurant> restaurants = [
  Restaurant(
      imageUrl: 'assets/images/jamys_burger.jpg',
      name: 'Jamys Burger',
      type: 'Burger',
      city: "Frankfurt",
      description:
          "Bei JAMY'S gibt es Burger aus Angus-Rindfleisch, Veggie Burger, Chicken Burger, Fries, Salate und Desserts",
      distance: 3.1 // Test value
      ),
  Restaurant(
      imageUrl: 'assets/images/blockhouse.jpg',
      name: 'Blockhouse',
      type: 'Steak',
      city: "Frankfurt",
      description:
          "Mit dem ersten Block House in Hamburg fing 1968 alles an. Mittlerweile verwöhnen wir unsere Gäste europaweit in 50 Restaurants mit Steaks",
      distance: 0.4 // Test value
      ),
  Restaurant(
      imageUrl: 'assets/images/heidi_und_paul.jpg',
      name: 'Heidi und Paul',
      type: 'Salat',
      city: "Frankfurt",
      description: "Täglich frische, individuelle Salate und Wraps",
      distance: 1.6 // Test value
      ),
  Restaurant(
      imageUrl: 'assets/images/shellys_burger.jpg',
      name: "Shelly's Burger",
      type: 'Burger',
      city: "Frankfurt",
      description: "Mit „Shelly's Burger & Falafel“ kommen nun die Burger zurück auf die untere Berger",
      distance: 0.2 // Test value
      ),
];

List<Restaurant> favourites = [
  Restaurant(
      imageUrl: 'assets/images/shellys_burger.jpg',
      name: "Shelly's Burger",
      type: 'Burger',
      city: "Frankfurt",
      description: "Mit „Shelly's Burger & Falafel“ kommen nun die Burger zurück auf die untere Berger",
      distance: 0.2 // Test value
      ),
  Restaurant(
      imageUrl: 'assets/images/heidi_und_paul.jpg',
      name: 'Heidi und Paul',
      type: 'Salat',
      city: "Frankfurt",
      description: "Täglich frische, individuelle Salate und Wraps",
      distance: 1.6 // Test value
      ),
];

