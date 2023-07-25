import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeButton extends GetView<HomeController> {
  const HomeButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20),
      itemCount: 3,
      itemBuilder: (context, index) {
        late String title;
        late IconData iconData;
        late VoidCallback onTap;

        switch (index) {
          case 0:
            title = 'Kitab Nailul Murod';
            iconData = Icons.book;
            onTap = () => Get.toNamed(Routes.dashboard);
            break;
          case 1:
            title = 'Terakhir Dibaca';
            iconData = Icons.read_more;
            onTap = () => Get.toNamed(Routes.bookmark);
            break;
          case 2:
            title = 'Tentang Aplikasi';
            iconData = Icons.phone_iphone;
            onTap = () => Get.toNamed(Routes.about);
            break;
        }
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Material(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(9),
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: Icon(
                      iconData,
                      size: 80,
                      color: Colors.grey.shade900,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
    );
  }
}
