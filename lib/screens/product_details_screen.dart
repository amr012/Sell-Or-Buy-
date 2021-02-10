import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_ecommerce/components/custom_flat_button.dart';
import 'package:my_ecommerce/components/custom_text.dart';
import 'package:my_ecommerce/constants.dart';
import 'package:my_ecommerce/models/products_model.dart';
import 'package:octo_image/octo_image.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel productModel;

  ProductDetailsScreen({this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * .35,
                  width: MediaQuery.of(context).size.width,
                  child: OctoImage(
                    image: CachedNetworkImageProvider(productModel.image),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                      'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                    ),
                    errorBuilder: (context, url, error) {
                      return Image.asset("assets/images/icon_men_shoes.png");
                    },
                    fit: BoxFit.fill,
                  ),),
              Padding(
                padding: const EdgeInsets.all(15),
                child: CustomText(
                  text: productModel.name,
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width * .4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.grey)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomText(
                        text: "Size",
                        fontWeight: FontWeight.w500,
                      ),
                      CustomText(
                        text: productModel.size,
                        fontWeight: FontWeight.bold,
                        color: K.MAIN_COLOR,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: CustomText(
                  text: "Details",
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: AutoSizeText(
                   productModel.description,
                  maxLines: 10,
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 20, top: 10),
                child: Column(
                  children: [
                    CustomText(
                      text: "PRICE",
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: "\$" + productModel.price,
                      color: K.MAIN_COLOR,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: CustomFlatButton(
                  width: 150,
                  text: "ADD",
                  onPress: () {},
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
