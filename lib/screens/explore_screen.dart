import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/components/custom_product_card.dart';
import 'package:my_ecommerce/components/custom_text.dart';
import 'package:my_ecommerce/components/loading_widget.dart';
import 'package:my_ecommerce/constants.dart';
import 'package:my_ecommerce/controllers/category_conroller.dart';
import 'package:my_ecommerce/enums/view_state.dart';
import 'package:octo_image/octo_image.dart';

class ExploreScreen extends StatelessWidget {
  final _controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
          () => (_controller.state == ViewState.busy)
          ? LoadingWidget()
          : SingleChildScrollView(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
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
                    child: Obx(() => ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _controller.categoryModel.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(50)),
                                  height: 60,
                                  width: 60,
                                  child: OctoImage(
                                    image: CachedNetworkImageProvider(
                                      _controller.categoryModel[index].image
                                    ),
                                    placeholderBuilder: OctoPlaceholder.blurHash(
                                      'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                                    ),
                                    errorBuilder: (context, url, error) {
                                      return Image.asset("assets/images/icon_men_shoes.png");
                                    },
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                                SizedBox(height: 10),
                                CustomText(
                                  fontWeight: FontWeight.w500,
                                  text: _controller.categoryModel[index].name,
                                )
                              ],
                            ),
                          );
                        })),
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
                    child: Obx(() => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _controller.productModel.length,
                          itemBuilder: (context, index) {
                            return CustomProductsCard(
                              image: _controller.productModel[index].image,
                              name: _controller.productModel[index].name,
                              description:
                                  _controller.productModel[index].description,
                              price:
                                  _controller.productModel[index].price + " \$",
                            );
                          },
                        )),
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
            ),
    ));
  }
}
