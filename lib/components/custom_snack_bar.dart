import 'package:flutter/material.dart';
import 'package:my_ecommerce/components/custom_text.dart';

class CustomSnackBar extends  StatelessWidget {
 final  BuildContext context;
 CustomSnackBar({this.context});
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
        content: CustomText(text: "added to cart",));
  }
}
