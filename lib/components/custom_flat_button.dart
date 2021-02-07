
import 'package:flutter/material.dart';

import '../constants.dart';
import 'custom_text.dart';

class CustomFlatButton extends StatelessWidget {
  final String text;
  final Function onPress;
  CustomFlatButton({this.text,this.onPress});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
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
