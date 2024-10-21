import 'package:f3_project_1/conntroller/auth_controller.dart';
import 'package:f3_project_1/screens/register_screeen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreeen extends StatefulWidget {
  const LoginScreeen({super.key});

  @override
  State<LoginScreeen> createState() => _LoginScreeenState();
}

class _LoginScreeenState extends State<LoginScreeen> {
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
                    authController.login();
                  }, child: Text('Login')),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(onPressed: (){
                    Get.to(()=> RegisterScreeen());
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