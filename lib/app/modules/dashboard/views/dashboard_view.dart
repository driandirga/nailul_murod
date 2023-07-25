import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kitab Nailul Murod'),
        centerTitle: true,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20),
        itemCount: 7,
        itemBuilder: (context, index) {
          late String title;
          late String slug;

          switch (index) {
            case 0:
              title = 'Wirid';
              slug = 'WR';
              break;
            case 1:
              title = 'Dzikir';
              slug = 'DZ';
              break;
            case 2:
              title = 'Rotib';
              slug = 'RO';
              break;
            case 3:
              title = 'Hidzib';
              slug = 'HZ';
              break;
            case 4:
              title = 'Doa';
              slug = 'DO';
              break;
            case 5:
              title = 'Qoshidah';
              slug = 'QD';
              break;
            case 6:
              title = 'Sholawat';
              slug = 'SW';
              break;
          }
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Material(
              color: index.isEven ? Colors.indigo : Colors.blue,
              borderRadius: BorderRadius.circular(100),
              child: InkWell(
                onTap: () => Get.toNamed(Routes.listing,
                    parameters: {'title': title, 'slug': slug}),
                borderRadius: BorderRadius.circular(100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Text(
                      title,
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
