import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/components/custom_text.dart';
import 'package:my_ecommerce/constants.dart';
import 'package:my_ecommerce/controllers/ststus_change_controller.dart';

class DeliveryTimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.put(StatusChangeController()),
        builder: (controller)=>Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 35,
            ),
            RadioListTile<Delivery>(
              value: Delivery.StandardDelivery,
              groupValue: controller.delivery,
              onChanged: (Delivery value) {
                controller.getDelivery(value);
              },
              title: CustomText(
                text: "Standard Delivery",
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
              subtitle: CustomText(
                text: "\nOrder will be delivered between 3 - 5 business days",
              ),
              activeColor: K.MAIN_COLOR,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: RadioListTile<Delivery>(
                value: Delivery.NextDayDelivery,
                groupValue: controller.delivery,
                onChanged: (Delivery value) {
                  controller.getDelivery(value);
                },
                title: CustomText(
                  text: "Next Day Delivery",
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
                subtitle: CustomText(
                  text:
                  "\nPlace your order before 6pm and your items will be delivered the next day",
                ),
                activeColor: K.MAIN_COLOR,
              ),
            ),
            RadioListTile<Delivery>(
              value: Delivery.NominatedDelivery,
              groupValue: controller.delivery,
              onChanged: (Delivery  value) {
                controller.getDelivery(value);
              },
              title: CustomText(
                text: "Nominated Delivery",
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
              subtitle: CustomText(
                text:
                "\nPick a particular date from the calendar and order will be delivered on selected date",
              ),
              activeColor: K.MAIN_COLOR,
            ),
          ],
        )));
  }
}
