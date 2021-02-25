
import 'package:flutter/material.dart';
import 'package:my_ecommerce/components/custom_text.dart';

class CustomListTile extends StatelessWidget {
  final String iconImage;
  final String text;
  final Function onPress;
  CustomListTile({this.text,this.iconImage,this.onPress});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: onPress,
        child: ListTile(
          leading: Image.asset(iconImage),
          title: CustomText(
            text: text,fontSize: 20,fontWeight: FontWeight.w400,
            color: Colors.black,),
          trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,
          size: 17,),
        ),
      ),
    );
  }
}
