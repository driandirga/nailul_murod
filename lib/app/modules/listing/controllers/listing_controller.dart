import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:async/async.dart';

import '../../../helper/debounce.dart';
import '../../../providers/db_provider.dart';
import '../../../routes/app_pages.dart';
import '../providers/kitab_provider.dart';

class ListingController extends GetxController {
  //TODO: Implement ListingController

  final count = 0.obs;
  final AsyncMemoizer dCMemorizer = AsyncMemoizer();
  final debouncer = Debouncer(milliseconds: 1000);
  final TextEditingController cSearch = TextEditingController();
  final kitabProvider = KitabProvider();
  final filterKitab = FilterKitab();

  ///search tf
  Widget searchTF() {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              5.0,
            ),
          ),
        ),
        filled: true,
        fillColor: Colors.white60,
        contentPadding: EdgeInsets.all(15.0),
        hintText: 'Cari judul',
      ),
      onSubmitted: (string) {
        debouncer.run(
          () {
            update();
            filterKitab.filterList(
                Get.parameters['title']!.toLowerCase(), string);
            listKitab();
          },
        );
      },
    );
  }

  Widget listKitab() {
    return FutureBuilder(
      future: kitabProvider.getAllKitab(Get.parameters['title']!.toLowerCase()),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  onTap: () async {
                    Get.toNamed(Routes.detail, parameters: {
                      'title': '${snapshot.data[index].title}',
                      'detail': '${snapshot.data[index].detail}',
                    });
                    DBProvider.db.deleteDtlBookmark(
                        snapshot.data[index].id, snapshot.data[index].title);
                    DBProvider.db.createBookmark({
                      'id': '${snapshot.data[index].id}',
                      'title': '${snapshot.data[index].title}',
                      'detail': '${snapshot.data[index].detail}',
                    });
                  },
                  leading: CircleAvatar(
                    radius: 24,
                    child: Text(Get.parameters['slug']!),
                  ),
                  title: Text('${snapshot.data[index].title}',
                      style: const TextStyle(fontSize: 18)),
                  tileColor: index.isEven ? Colors.yellow : Colors.green,
                ),
              );
            },
          );
        }
      },
    );
  }

  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
