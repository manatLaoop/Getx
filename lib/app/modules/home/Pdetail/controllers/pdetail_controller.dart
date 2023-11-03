import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx/app/data/models/pdetail_model.dart';
import 'package:getx/app/data/providers/pdetail_provider.dart';

class PdetailController extends GetxController {
  //TODO: Implement PdetailController

  final count = 0.obs;

  RxList<Pdetail> data = <Pdetail>[].obs;

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
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> getProductDetail({required String id}) async {
    data.clear();
    var pRespone = await Get.find<PdetailProvider>().getPdetail(id);
    if (pRespone != null) {
      data.add(pRespone);
    }
    return;
  }
}
