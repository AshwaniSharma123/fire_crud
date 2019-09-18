import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  Container(
          color: Colors.pinkAccent,
          child: Text('login successful',style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 30.0,
          ),),
        ),
      ),
    );
  }
}
