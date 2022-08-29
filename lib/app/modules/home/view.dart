import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_file_app/app/modules/home/controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home View'),
      ),
    );
  }
}
