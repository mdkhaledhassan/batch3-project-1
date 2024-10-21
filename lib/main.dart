import 'package:f3_project_1/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'screens/login_screeen.dart';

final box = GetStorage();

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Batch-3 Project-1',
      home: box.read('token') != null ? HomeScreen() : LoginScreeen(),
    );
  }
}
