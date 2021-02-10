import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_ecommerce/controllers/base_controller.dart';
import 'package:my_ecommerce/enums/view_state.dart';
import 'package:my_ecommerce/models/category_model.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/models/products_model.dart';

class CategoryController extends BaseController{
  final _fireStore = FirebaseFirestore.instance;
   final _categoryModel = <CategoryModel>[].obs;
   final _productModel = <ProductModel>[].obs;

   List<CategoryModel> get categoryModel => _categoryModel;

   List<ProductModel> get productModel => _productModel;


  Future<List<CategoryModel>> getAllCategory() async {
    final data = await _fireStore.collection("category").get();
    return data.docs.map((e) => (CategoryModel.fromJson(e))).toList();
  }


  Future<List<ProductModel>> getAllProduct() async {
    final data = await _fireStore.collection("products").get();
    return data.docs.map((e) => (ProductModel.fromJson(e))).toList();
  }


  @override
  Future<void> onInit() async {
  super.onInit();
  setState(ViewState.busy);
  _categoryModel.assignAll(await getAllCategory());
  _productModel.assignAll(await getAllProduct());
  setState(ViewState.idle);

  }
}