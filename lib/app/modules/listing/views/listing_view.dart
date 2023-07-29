import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../helper/debounce.dart';
import '../../../providers/db_provider.dart';
import '../../../routes/app_pages.dart';
import '../controllers/listing_controller.dart';
import '../providers/kitab_provider.dart';

class ListingView extends GetView<ListingController> {
  ListingView({Key? key}) : super(key: key);
  final kitabProvider = KitabProvider();
  final TextEditingController cSearch = TextEditingController();
  final debouncer = Debouncer(milliseconds: 1000);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.parameters['title'].toString()),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0), child: controller.searchTF()),
          Expanded(
            child: controller.listKitab(),
          ),
        ],
      ),
    );
  }
}
