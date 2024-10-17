import 'package:get/get.dart';

import '../models/category_model.dart';
import '../repository/category_repo.dart';

class CategoryController extends GetxController {
  final categoryData = <Category>[].obs;

  getCateggoryDate() async {
    var catData = await CategoryRepo.getCategoryData();
    if(catData.data != null)
    {
      categoryData.value = catData.data!;
    }
    update();
    refresh();
  }
}