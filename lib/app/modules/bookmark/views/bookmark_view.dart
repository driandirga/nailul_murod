import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nailul_murod/app/modules/home/views/home_view.dart';

import '../../../providers/db_provider.dart';
import '../../../routes/app_pages.dart';
import '../controllers/bookmark_controller.dart';

class BookmarkView extends GetView<BookmarkController> {
  const BookmarkView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terakhir Dibaca'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: DBProvider.db.getAllBookmark(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text('Data Kosong', style: TextStyle(fontSize: 18)),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () => Get.toNamed(Routes.detail, parameters: {
                      'title': '${snapshot.data[index].title}',
                      'detail': '${snapshot.data[index].detail}',
                    }),
                    title: Text('${snapshot.data[index].title}',
                        style: const TextStyle(fontSize: 18)),
                    tileColor: index.isEven ? Colors.yellow : Colors.green,
                    trailing: GestureDetector(
                      onTap: () {
                        DBProvider.db.deleteDtlBookmark(snapshot.data[index].id,
                            snapshot.data[index].title);
                        Get.to(HomeView());
                        Get.to(const BookmarkView());
                      },
                      child: const Icon(Icons.delete),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
