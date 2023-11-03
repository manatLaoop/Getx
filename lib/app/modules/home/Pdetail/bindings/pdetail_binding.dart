import 'package:get/get.dart';
import 'package:getx/app/data/providers/pdetail_provider.dart';

import '../controllers/pdetail_controller.dart';

class PdetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PdetailController>(
      () => PdetailController(),
    );
    Get.lazyPut<PdetailProvider>(
      () => PdetailProvider(),
    );
  }
}
