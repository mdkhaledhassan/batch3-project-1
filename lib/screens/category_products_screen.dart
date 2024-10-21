import 'package:f3_project_1/api-list.dart';
import 'package:f3_project_1/conntroller/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryProductsScreen extends StatefulWidget {
  const CategoryProductsScreen({super.key, required this.id});
  final int? id;

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  final categoryController = Get.put(CategoryController());
  @override
  void initState() {
    categoryController.getCateggoryProductDate(id: widget.id!);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
              child: Obx(
                ()=> categoryController.categoryProductData.isNotEmpty? 
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: categoryController.categoryProductData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 5
                            )
                          ]
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage(APIList.imageBaseURL+'/productpic/'+categoryController.categoryProductData[index].picture.toString()))
                              ),),
                              SizedBox(
                                height: 10,
                              ),
                              Text(categoryController.categoryProductData[index].title.toString()),
                              SizedBox(
                                height: 10,
                              ),
                              Text(categoryController.categoryProductData[index].catname.toString()),
                              SizedBox(
                                height: 10,
                              ),
                              Text(categoryController.categoryProductData[index].price.toString())
                          ],
                        ),
                      ),
                    );
                
                  },
                ): const CircularProgressIndicator(),
              ),
            ),
    );
  }
}