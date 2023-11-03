import 'dart:developer';

import 'package:get/get.dart';

import '../models/pdetail_model.dart';

class PdetailProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Pdetail.fromJson(map);
      if (map is List)
        return map.map((item) => Pdetail.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'https://dummyjson.com/products/';
  }

  Future<Pdetail?> getPdetail(String id) async {
    final response = await get('$id');
    return response.body;
  }

  // Future<Response<Pdetail>> postPdetail(Pdetail pdetail) async =>
  //     await post('pdetail', pdetail);
  // Future<Response> deletePdetail(int id) async => await delete('pdetail/$id');
}
