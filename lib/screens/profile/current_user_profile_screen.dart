import 'package:flutter/material.dart';

class CurrentUserProfileScreen extends StatefulWidget {
  const CurrentUserProfileScreen({ Key? key }) : super(key: key);

  @override
  _CurrentUserProfileScreenState createState() => _CurrentUserProfileScreenState();
}

class _CurrentUserProfileScreenState extends State<CurrentUserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Current user profile screen'),),
    );
  }
}