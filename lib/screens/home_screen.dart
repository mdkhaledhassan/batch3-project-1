import 'package:f3_project_1/api-list.dart';
import 'package:f3_project_1/conntroller/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final categoryController = Get.put(CategoryController());
  @override
  void initState() {
    categoryController.getCateggoryDate();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          ()=> categoryController.categoryData.isNotEmpty? 
          ListView.builder(
            shrinkWrap: true,
            itemCount: categoryController.categoryData.length,
            itemBuilder: (context, index) {
              return Column(
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
              );
          
            },
          ): const CircularProgressIndicator(),
        ),
      )
    );
  }
}