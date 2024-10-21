import 'package:f3_project_1/conntroller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreeen extends StatefulWidget {
  const RegisterScreeen({super.key});

  @override
  State<RegisterScreeen> createState() => _RegisterScreeenState();
}

class _RegisterScreeenState extends State<RegisterScreeen> {
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          ()=> Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: authController.nameController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: authController.phoneController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: authController.passwordController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(onPressed: (){
                    authController.reggister();
                  }, child: Text('Register'))
                ],
              ),
              authController.isLoaing.value == true?
              CircularProgressIndicator(): SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}