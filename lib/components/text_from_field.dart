
import 'package:flutter/material.dart';

import '../constants.dart';
import 'custom_text.dart';

class CustomTextFromField extends StatelessWidget {
  final String text;
  final String hintText;
  final Function onSaved;
  final Function validator;
  CustomTextFromField({this.text,this.hintText,this.onSaved,this.validator});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: text,
          fontSize: 16,
          color: K.GREY_COLOR,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: TextFormField(
            onSaved: onSaved,
            validator: validator,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.black,),
                fillColor: Colors.white),
          ),
        )
      ],
    );
  }
}
