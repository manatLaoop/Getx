import 'package:get/get.dart';
import 'package:getx/app/data/providers/product_api_provider.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    // Get.lazyPut<HomeController>(
    //   () => HomeController(),
    // );

    Get.put(ProductApiProvider());
  }
}
