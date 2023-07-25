import 'package:get/get.dart';

import '../../../providers/db_provider.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    DBProvider.db.database;
  }
}
