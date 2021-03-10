import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/components/custom_flat_button.dart';
import 'package:my_ecommerce/constants.dart';
import 'package:my_ecommerce/controllers/ststus_change_controller.dart';
import 'package:my_ecommerce/screens/status_change/add_address_screen.dart';
import 'package:my_ecommerce/screens/status_change/delivery_time_screen.dart';
import 'package:my_ecommerce/screens/status_change/summary_screen.dart';
import 'package:status_change/status_change.dart';

class StatusChangeHorizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;

    return GetBuilder<StatusChangeController>(
        init: StatusChangeController(),
        builder:  (controller)=>Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: Text(
              "CheckOut",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 100,
                  child: StatusChange.tileBuilder(
                    theme: StatusChangeThemeData(
                      direction: Axis.horizontal,
                      connectorTheme: ConnectorThemeData(space: 1.0, thickness: 1.0),
                    ),
                    builder: StatusChangeTileBuilder.connected(
                      itemWidth: (_) =>
                      MediaQuery.of(context).size.width / _processes.length,
                      nameWidgetBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            _processes[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: controller.getColor(index),
                            ),
                          ),
                        );
                      },
                      indicatorWidgetBuilder: (_, index) {
                        if (index <= controller.processIndex) {
                          return DotIndicator(
                            size: 35.0,
                            border: Border.all(color: Colors.green, width: 1),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return OutlinedDotIndicator(
                            size: 30,
                            borderWidth: 1.0,
                            color: todoColor,
                          );
                        }
                      },
                      lineWidgetBuilder: (index) {
                        if (index > 0) {
                          if (index == controller.processIndex) {
                            final prevColor = controller.getColor(index - 1);
                            final color = controller.getColor(index);
                            var gradientColors;
                            gradientColors = [
                              prevColor,
                              Color.lerp(prevColor, color, 0.5)
                            ];
                            return DecoratedLineConnector(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: gradientColors

                                ),
                              ),
                            );
                          } else {
                            return SolidLineConnector(
                              color: controller.getColor(index),
                            );
                          }
                        } else {
                          return null;
                        }
                      },
                      itemCount: _processes.length,
                    ),
                  ),
                ),
                controller.pages == Pages.DeliveryTime
                    ? DeliveryTimeScreen()
                    : controller.pages == Pages.AddAddress
                    ? AddAddressScreen()
                    : SummaryScreen()
              ],
            ),
          ),
          floatingActionButton: showFab
              ? CustomFlatButton(
            text: "NEXT",
            width: 150,
            onPress: (){
              controller.getPage();
            },
          )
              : null,
        ));
  }
}
final _processes = [
  'Delivery',
  'Address',
  'Summer',
];