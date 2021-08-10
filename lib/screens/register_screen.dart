import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({ Key? key }) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: _email,
            decoration: InputDecoration(
              hintText: "Email"
            ),
          ),

          SizedBox(height: 30,),
          
          TextFormField(
            controller: _password,
            decoration: InputDecoration(
              hintText: "Password"
            ),
          ),
        ],
      ),
    );
  }
}