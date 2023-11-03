import 'dart:developer';

import 'package:get/get.dart';

import '../models/product_api_model.dart';

class ProductApiProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return ProductApi.fromJson(map);
      if (map is List)
        return map.map((item) => ProductApi.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'https://dummyjson.com';
  }

  Future<ProductApi?> getProductApi() async {
    final response = await get('/products');

    return response.body;
  }

  // Future<Response<ProductApi>> postProductApi(ProductApi productapi) async =>
  //     await post('productapi', productapi);
  // Future<Response> deleteProductApi(int id) async =>
  //     await delete('productapi/$id');
}
