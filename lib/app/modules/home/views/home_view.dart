import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx/app/data/models/product_api_model.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.onInit();

    return Scaffold(
        appBar: AppBar(
          title: Text('product'.tr),
          centerTitle: true,
        ),
        body: GridView.builder(
          itemCount: controller.data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16.0,
            // crossAxisSpacing: 16.0,
            // childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                  onTap: () {
                    Get.toNamed('/home/pdetail', parameters: {
                      'id': controller.data[index].id.toString()
                    });
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    '${controller.data[index].thumbnail}'))),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      color: Colors.black45,
                                      child: Row(
                                        children: [
                                          Text(
                                            '${controller.data[index].price}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text('Th')
                                        ],
                                      )))
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      color: Colors.black45,
                                      child: Text(
                                        '${controller.data[index].category}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      )))
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
