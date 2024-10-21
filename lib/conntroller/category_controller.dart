import 'package:f3_project_1/models/categgory_product_model.dart';
import 'package:get/get.dart';

import '../models/category_model.dart';
import '../repository/category_repo.dart';

class CategoryController extends GetxController {
  final categoryData = <Category>[].obs;
  final categoryProductData = <CategoryProduct>[].obs;

  getCateggoryDate() async {
    var catData = await CategoryRepo.getCategoryData();
    if(catData.data != null)
    {
      categoryData.value = catData.data!;
    }
    update();
    refresh();
  }

  getCateggoryProductDate({required int id}) async {
    var catProductData = await CategoryRepo.getCategoryProductData(id: id);
    if(catProductData.data != null)
    {
      categoryProductData.value = catProductData.data!;
    }
    update();
    refresh();
  }
}