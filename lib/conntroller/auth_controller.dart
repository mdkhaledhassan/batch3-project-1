import 'package:f3_project_1/main.dart';
import 'package:f3_project_1/screens/home_screen.dart';
import 'package:f3_project_1/screens/login_screeen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api-list.dart';
import '../server.dart';

class AuthController extends GetxController {
  static Server server = Server();
  final isLoaing = false.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login() async {
    isLoaing.value = true;
    Map<String, dynamic> body = {
      'phonenumber': phoneController.text,
      'password': passwordController.text
    };
    try{
        await server.postRequest(endPoint: APIList.login, body: body).then((response){
        if(response.statusCode == 200)
        {
          phoneController.clear();
          passwordController.clear();
          isLoaing.value = false;
          box.write('token', response.data['token'].toString());
          box.write('userID', response.data['data']['id']);
          Get.snackbar('Success', response.data['message'].toString(),backgroundColor: Colors.green,colorText: Colors.white);
          Get.to(()=> const HomeScreen());
        }else
        {
          isLoaing.value = false;
          Get.snackbar('Failed', response.data['message'].toString(),backgroundColor: Colors.red,colorText: Colors.white);
        }
      });
    } catch(e){
      isLoaing.value = false;
      print(e);
    }
  }

  reggister() async {
    isLoaing.value = true;
    Map<String, dynamic> body = {
      'name': nameController.text,
      'phonenumber': phoneController.text,
      'password': passwordController.text
    };
    try{
        await server.postRequest(endPoint: APIList.register, body: body).then((response){
        if(response.statusCode == 200)
        {
          nameController.clear();
          phoneController.clear();
          passwordController.clear();
          isLoaing.value = false;
          Get.snackbar('Success', response.data['message'].toString(),backgroundColor: Colors.green,colorText: Colors.white);
          Get.to(()=> const LoginScreeen());
        }else
        {
          isLoaing.value = false;
          Get.snackbar('Failed', response.data['message'].toString(),backgroundColor: Colors.red,colorText: Colors.white);
        }
      });
    } catch(e){
      isLoaing.value = false;
      print(e);
    }
  }

  logout() async {
    isLoaing.value = false;
    try{
      server.getRequest(endPoint: APIList.logout).then((response){
        if(response.statusCode == 200)
        {
          isLoaing.value = false;
          box.remove('token');
          box.remove('userID');
          Get.snackbar('Success', response.data['message'].toString(),backgroundColor: Colors.green,colorText: Colors.white);
          Get.offAll(()=> LoginScreeen());
        }
        else{
          isLoaing.value = false;
          Get.snackbar('Failed', response.data['message'].toString(),backgroundColor: Colors.red,colorText: Colors.white);
        }
      });
    }catch(e){
      isLoaing.value = false;
      print(e);
    }

  }
}