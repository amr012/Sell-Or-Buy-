import 'package:flutter/material.dart';
import 'package:my_ecommerce/components/custom_flat_button.dart';
import 'package:my_ecommerce/components/custom_text.dart';

import '../constants.dart';

class CustomRow extends StatelessWidget {
  final String text;
  final String price;
  final String buttonText;
  final double buttonWidth;
  final Function onPress;


  CustomRow({this.text, this.price, this.buttonText, this.buttonWidth,this.onPress});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 20, top: 10),
          child: Column(
            children: [
              CustomText(
                text: text,
                color: Colors.grey,
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: "\$" + price,
                color: K.MAIN_COLOR,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: CustomFlatButton(
            width: buttonWidth,
            text: buttonText,
            onPress: onPress,
          ),
        )
      ],
    );
  }
}
