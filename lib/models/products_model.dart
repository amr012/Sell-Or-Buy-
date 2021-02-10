import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String image;
  String name;
  String description;
  String price;
  String size;

  ProductModel({this.image, this.name, this.description, this.price, this.size});

  ProductModel.fromJson(DocumentSnapshot snapshot){
    final json = snapshot.data();
    image = json["image"];
    name = json["name"];
    description = json["description"];
    price = json["price"];
    size = json["size"];
  }

  Map<String,dynamic> toJson(){
    var json = <String,dynamic>{};
    json["image"] = image;
    json["name"]  = name;
    json["description"] = description;
    json["price"] = price;
    json["size"] = size;

    return json;
  }
}
