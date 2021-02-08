import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_ecommerce/controllers/base_controller.dart';
import 'package:my_ecommerce/enums/view_state.dart';
import 'package:my_ecommerce/models/category_model.dart';
import 'package:get/get.dart';

class CategoryController extends BaseController{
  final _fireStore = FirebaseFirestore.instance;
   final _categoryModel = <CategoryModel>[].obs;

   List<CategoryModel> get categoryModel => _categoryModel;


  Future<List<CategoryModel>> getAllCategory() async {
    final data = await _fireStore.collection("category").get();
    return data.docs.map((e) => (CategoryModel.fromJson(e))).toList();
  }



  @override
  Future<void> onInit() async {
  super.onInit();
  setState(ViewState.busy);
  _categoryModel.assignAll(await getAllCategory());
  setState(ViewState.idle);

  }
}