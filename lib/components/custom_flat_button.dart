
import 'package:flutter/material.dart';

import '../constants.dart';
import 'custom_text.dart';

class CustomFlatButton extends StatelessWidget {
  final String text;
  final Function onPress;
  final double width;
  CustomFlatButton({this.text,this.onPress,this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: width,
      child: FlatButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: onPress,
          color: K.MAIN_COLOR,
          child: CustomText(
            text: text,
            color: Colors.white,
          )),
    );
  }
}
