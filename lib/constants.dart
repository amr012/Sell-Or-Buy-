
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class K{
  static final String tableCartProduct = "cartProduct";
  static final String columnName = "name";
  static final String columnImage = "image";
  static final String columnQuantity = "quantity";
  static final String columnPrice = "price";

  static const MAIN_COLOR = Color(0xFF00C569);
  static const GREY_COLOR = Color(0xFF929292);

  static const textFieldTextStyle = TextStyle(fontSize: 19);

  static const textFieldDecoration = InputDecoration(
      hintStyle: TextStyle(color: Colors.black),hoverColor: MAIN_COLOR,
      focusColor: MAIN_COLOR,
      fillColor: MAIN_COLOR
  );
}