import 'package:flutter/material.dart';

List<Text> ages() {
  List<Text> age = [];
  for (var i = 0; i <= 100; i++) {
    age.add(
      Text(
        i.toString(),
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
  return age;
}

const boxShadow = [
  BoxShadow(
    color: Colors.grey,
    blurRadius: 4.0,
    spreadRadius: 3.0,
    offset: Offset(7.0, 3.0),
  ),
];
