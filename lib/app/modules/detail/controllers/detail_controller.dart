import 'package:get/get.dart';

class DetailController extends GetxController {
  //TODO: Implement DetailController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    Get.reset();
    super.onClose();
  }

  void increment() => count.value++;
}
