import 'package:flutter/material.dart';

class CaptionnedIcon extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min, // To prevent the row from taking full width
      children: <Widget>[
        Icon(Icons.star, size: 24.0, color: Colors.amber),
        SizedBox(width: 8.0), // Add some spacing between icon and text
        Text(
          'Rating',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}