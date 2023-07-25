import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nailul_murod/app/modules/home/components/home_banner.dart';

import '../components/home_button.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: Column(
            children: const [
              HomeBanner(),
              SizedBox(
                height: 20,
              ),
              HomeButton(),
            ],
          ),
        ),
      ),
    );
  }
}
