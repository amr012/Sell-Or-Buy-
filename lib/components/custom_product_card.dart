import 'package:flutter/material.dart';
import 'package:my_ecommerce/components/custom_text.dart';

class CustomProductsCard extends StatelessWidget {
  final String image;
  final String mainText;
  final String secondText;
  final String price;

  CustomProductsCard({this.image,this.price,this.mainText,this.secondText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 250,
        width: MediaQuery.of(context).size.width * .4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
                decoration:
                BoxDecoration(color: Colors.grey.shade100),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            CustomText(
              text: mainText,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CustomText(
                text:secondText ,
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            CustomText(
              text: price,
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
