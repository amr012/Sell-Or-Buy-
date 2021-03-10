import 'package:flutter/material.dart';
import 'package:my_ecommerce/components/custom_text.dart';
import 'package:show_up_animation/show_up_animation.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final Function(String value) onChanged;
  final double padding;
  final String errorLabel;
  final TextInputType type;
  final TextEditingController controller;
  final Function() onTap;
  final int maxLines;
  final bool isReadOnly;
  final String initialValue;
  final bool isPassword;
  final Color errorColor;
  final String text;

  CustomTextField(
      {this.padding,
        this.onChanged,
        this.label,
        this.errorLabel,
        this.controller,
        this.onTap,
        this.text,
        this.initialValue,
        this.isPassword = false,
        this.errorColor = Colors.red,
        this.type = TextInputType.text,
        this.maxLines = 1,
        this.isReadOnly = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(

        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            text: text,
            fontSize: 20,
            color: Colors.black,
          ),

          Container(
            height: 43,
            child: TextFormField(
                initialValue: initialValue,
                style: K.textFieldTextStyle.copyWith(
                  // fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
                keyboardType: type,
                controller: controller,
                onTap: onTap,
                obscureText: isPassword,
                textAlign: TextAlign.start,
                decoration: K.textFieldDecoration.copyWith(
                  hintText: label,
                  contentPadding:
                  EdgeInsets.only(right: padding != null ? padding : 0),
                ),
                onChanged: onChanged),
          ),
          if (errorLabel != null && errorLabel.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,vertical: 2.5
              ),
              child: ShowUpAnimation(
                child: Text(
                  '$errorLabel',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: errorColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}