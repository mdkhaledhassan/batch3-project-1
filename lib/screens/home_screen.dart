import 'package:f3_project_1/api-list.dart';
import 'package:f3_project_1/conntroller/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../conntroller/auth_controller.dart';
import 'category_products_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final categoryController = Get.put(CategoryController());
  final authController = Get.put(AuthController());
  @override
  void initState() {
    categoryController.getCateggoryDate();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        ()=> Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Obx(
                ()=> categoryController.categoryData.isNotEmpty? 
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: categoryController.categoryData.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(()=> CategoryProductsScreen(id: categoryController.categoryData[index].id));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          height: 140,
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
                                  image: DecorationImage(image: NetworkImage(APIList.imageBaseURL+'/catpic/'+categoryController.categoryData[index].picture.toString()))
                                ),),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(categoryController.categoryData[index].catname.toString())
                            ],
                          ),
                        ),
                      ),
                    );
                
                  },
                ): const CircularProgressIndicator(),
              ),
            ),
            Positioned(
              bottom: 20,
              child: ElevatedButton(onPressed: (){
                authController.logout();
              }, child: Text('Logout')),
            ),
            authController.isLoaing.value == true?
            CircularProgressIndicator(): SizedBox()
          ],
        ),
      )
    );
  }
}