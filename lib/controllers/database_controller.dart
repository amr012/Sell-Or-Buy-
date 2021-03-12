import 'package:my_ecommerce/controllers/base_controller.dart';
import 'package:my_ecommerce/models/cart_product_model.dart';
import 'package:my_ecommerce/services/database_services.dart';
import 'package:get/get.dart';

class DataBaseController extends BaseController{

  final _cartProductModel = <CartProductModel>[].obs;
  double _totalPrice = 0.0;

  List<CartProductModel> get cartProductModel => _cartProductModel;
  double get totalPrice => _totalPrice;


  @override
  void onInit() {
    super.onInit();
    getAllProducts();
  } // DataBaseController(){
  //   getAllProducts();
  // }

  insertProduct(CartProductModel cartProductModel) async {
    var db = DataBaseServices.db;
    await db.insert(cartProductModel);
  }

  getAllProducts() async {
    var db = DataBaseServices.db;
    _cartProductModel.assignAll(await db.getAllProduct()) ;
    print(_cartProductModel.length);
    getTotalPrice();
  }

  getTotalPrice(){
    _totalPrice =0;
    for(int i =0 ; i < _cartProductModel.length ; i++){
      _totalPrice += double.parse(_cartProductModel[i].price)  ;
  }
    print(_totalPrice);
  }

  deleteProduct(String name) async {
    var db = DataBaseServices.db;
    await db.deleteProduct(name);
    await getAllProducts();
  }

}