import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/components/custom_row.dart';
import 'package:my_ecommerce/components/custom_text.dart';
import 'package:my_ecommerce/constants.dart';
import 'package:my_ecommerce/controllers/database_controller.dart';

class CartScreen extends StatelessWidget {
  final _controller = Get.put(DataBaseController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.builder(
                  itemCount: _controller.cartProductModel.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 140,
                        child: Row(
                          children: [
                            Container(
                                width: 140,
                                height: 140,
                                child: Image.network(
                                  _controller.cartProductModel[index].image,
                                  fit: BoxFit.fill,
                                )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: CustomText(
                                     text: _controller.cartProductModel[index].name,
                                    fontSize: 22,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: CustomText(
                                    text: "\$" + _controller.cartProductModel[index].price,
                                    fontSize: 20,
                                    color: K.MAIN_COLOR,
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.only(top: 10,left: 10),
                                //   child: Container(
                                //     width: 140,
                                //     height: 50,
                                //     color: Colors.grey.shade200,
                                //     child: Row(
                                //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                //       children: [
                                //         IconButton(icon: Icon(Icons.add),color: Colors.black, onPressed: (){}),
                                //         CustomText(text: "4",fontSize: 20,fontWeight: FontWeight.w500,),
                                //         Padding(
                                //           padding: const EdgeInsets.only(bottom: 10),
                                //           child: IconButton(icon: Icon(Icons.minimize),color: Colors.black, onPressed: (){}),
                                //         )
                                //       ],
                                //     ),),
                                // )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
          CustomRow(
            text: "TOTAL",
            buttonWidth: 150,
            buttonText: "CHECKOUT",
            price: _controller.totalPrice.toString(),
            onPress: (){},
          )

        ],
      ),
    );
  }
}
