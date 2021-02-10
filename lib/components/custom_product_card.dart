import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_ecommerce/components/custom_text.dart';
import 'package:octo_image/octo_image.dart';

class CustomProductsCard extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final String price;

  CustomProductsCard({this.image, this.price, this.name, this.description});

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
                child: OctoImage(
                  image: CachedNetworkImageProvider(image),
                  placeholderBuilder: OctoPlaceholder.blurHash(
                    'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                  ),
                  errorBuilder: (context, url, error) {
                    return Image.asset("assets/images/icon_men_shoes.png");
                  },
                  fit: BoxFit.fill,
                ),
                decoration: BoxDecoration(color: Colors.grey.shade100),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            CustomText(
              maxLines: 1,
              text: name,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CustomText(
                maxLines: 1,
                text: description,
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
