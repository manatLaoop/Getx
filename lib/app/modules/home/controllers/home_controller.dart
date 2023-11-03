import 'dart:developer';
import 'dart:ffi';

import 'package:get/get.dart';
import 'package:getx/app/data/models/product_api_model.dart';
import 'package:getx/app/data/providers/product_api_provider.dart';

class HomeController extends GetxController {
  List<Product> data = [];

  @override
  void onInit() {
    super.onInit();
    getProduct();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getProduct() async {
    var respone = await Get.find<ProductApiProvider>().getProductApi();
    var p = respone?.products ?? [];
    data.clear();
    data = p;
  }
}
