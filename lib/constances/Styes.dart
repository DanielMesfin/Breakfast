import 'package:flutter/material.dart';

class Styles {
  static const appBgColor = Color(0xFFDCDCDA);
  static const cardBgColor = Color(0xFF292F3F);
  static const buttonBgColor = Color(0xFF49622C);
  static const cartgroundColor = Color(0xffBCC536);
  // for App bar
  static const headerOneTextStyle = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.w800,
    fontStyle: FontStyle.normal,
    color: Colors.black,
  );
  // for sub App bar
  static const headerTwoTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w900,
    color: Colors.black,
  );
  // for item Name
  static const headerThreeTextStyle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
  // for description about the item .
  static final headerFourTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: Colors.grey[700],
  );

  static const buttonTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 17,
    color: Colors.black,
  );
  static const boldTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const normalTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
  final ButtonStyle style = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 20),
  );
  static const KInputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.grey,
    hintText: 'Enter the value',
    hintStyle: TextStyle(
      fontSize: 18,
      color: Colors.black87,
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent, width: 2.7),
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    ),
  );
  static const linkText = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 16, color: Styles.buttonBgColor);
}
