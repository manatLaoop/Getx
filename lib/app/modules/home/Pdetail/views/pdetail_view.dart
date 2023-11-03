import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pdetail_controller.dart';

class PdetailView extends GetView<PdetailController> {
  const PdetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pms = Get.parameters['id'];
    controller.getProductDetail(id: pms.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('product'.tr),
        centerTitle: true,
        actions: [
          TextButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            onTap: () {
                              Get.updateLocale(const Locale('th', 'TH'));
                              Navigator.pop(context);
                            },
                            title: const Text('ไทย'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            onTap: () {
                              Get.updateLocale(const Locale('en', 'US'));
                              Navigator.pop(context);
                            },
                            title: const Text('English'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.language,
                color: Colors.white,
              ),
              label: Text(
                'language'.tr,
                style: const TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: SingleChildScrollView(
          child: Obx(() => controller.data.length > 0
              ? Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.6,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.data[0].images!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.width * 0.6,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          '${controller.data[0].images![index]}'))),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Flexible(flex: 1, child: Text('title:'.tr)),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('${controller.data[0].title}'),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(flex: 1, child: Text('category:'.tr)),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('${controller.data[0].category}'),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(flex: 1, child: Text('price:'.tr)),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('${controller.data[0].price}'),
                        ],
                      ),
                    )
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ))),
    );
  }
}
