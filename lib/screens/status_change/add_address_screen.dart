import 'package:flutter/material.dart';
import 'package:my_ecommerce/components/custom_text_field.dart';

class AddAddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Container(
          child: Column(
            children: [
              CustomTextField(
                text: "Street 1",
                label: "enter your first street",
                onChanged: (v){},
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                text: "Street 2",
                label: "enter your second street",
                onChanged: (v){},
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                text: "City",
                label: "enter your city",
                onChanged: (v){},
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      text: "State",
                      label: "enter your state",
                      onChanged: (v){},
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: CustomTextField(
                      text: "Country",
                      label: "enter your country",
                      onChanged: (v){},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
