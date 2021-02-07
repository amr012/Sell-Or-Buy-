import 'package:flutter/material.dart';
import 'package:my_ecommerce/components/custom_product_card.dart';
import 'package:my_ecommerce/components/custom_text.dart';
import 'package:my_ecommerce/constants.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> names = [
      "Men",
      "Women",
      "Devices",
      "Gaming",
      "Dresses",
      "Foods"
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50, left: 30, right: 30),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(50)),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    border: InputBorder.none),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: CustomText(
              color: K.MAIN_COLOR,
              text: "Categories",
              fontSize: 22,
              fontWeight: FontWeight.bold,
              alignment: Alignment.topLeft,
            ),
          ),
          Container(
            height: 120,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(50)),
                          height: 60,
                          width: 60,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/images/icon_men_shoes.png",
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        CustomText(
                          text: names[index],
                        )
                      ],
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15, right: 15, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Best Selling",
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  color: K.MAIN_COLOR,
                  text: "See all",
                  fontSize: 20,
                )
              ],
            ),
          ),
          Container(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return CustomProductsCard(
                  image: "assets/images/card_image.png",
                  mainText: "BeoPlay Speaker",
                  secondText: "Bang and Olufsen",
                  price: "\$755",
                );
              },
            ),
          ),
          // RaisedButton(
          //   onPressed: () {
          //     AuthController.to.signOut();
          //     print(AuthController.to.currentUser.email);
          //   },
          //   child: Text("logout"),
          // )
        ],
      ),
    );
  }
}
