import 'package:f3_project_1/api-list.dart';
import 'package:f3_project_1/models/categgory_product_model.dart';
import 'package:f3_project_1/server.dart';

import '../models/category_model.dart';

class CategoryRepo {
  static Server server = Server();
  static CategoryModel categoryModel = CategoryModel();
  static CategoryProductModel categoryProductModel = CategoryProductModel();

  static Future<CategoryModel> getCategoryData() async {
    try{
      await server.getRequest(endPoint: APIList.shohwCategory).then((response){
        if(response.statusCode == 200)
        {
          categoryModel =  CategoryModel.fromJson(response.data);
          return categoryModel;
        }
      });
    }
    catch(e)
    {
      return categoryModel;
    }

    return categoryModel;
  }

  static Future<CategoryProductModel> getCategoryProductData({required int id}) async {
    try{
      await server.getRequest(endPoint: APIList.shohwCategoryProduct + '$id').then((response){
        if(response.statusCode == 200)
        {
          categoryProductModel =  CategoryProductModel.fromJson(response.data);
          return categoryProductModel;
        }
      });
    }
    catch(e)
    {
      return categoryProductModel;
    }

    return categoryProductModel;
  }
}