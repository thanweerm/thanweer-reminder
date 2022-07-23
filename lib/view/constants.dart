import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Color(0xFFE8EAF6),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
    borderSide: BorderSide.none,
  ),
  labelText: 'Pick a Date',
  suffixIcon: Align(
    widthFactor: 1.0,
    heightFactor: 1.0,
    child: Icon(Icons.calendar_today),
  ),
);
const kAppbarTitle = TextStyle(fontSize: 25, fontWeight: FontWeight.w700);
