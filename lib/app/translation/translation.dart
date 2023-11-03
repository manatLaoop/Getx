import 'package:get/get.dart';

class Language extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          'title': 'title',
          'category': 'category',
          'price': 'price',
          'product': 'Product',
          'language': 'language',
        },
        "th_TH": {
          'title': 'ชื่อ',
          'category': 'ประเภท',
          'price': 'ราคา',
          'product': 'สินค้า',
          'language': 'ภาษา',
        },
      };
}
