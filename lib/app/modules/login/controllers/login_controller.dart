import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController usernameController, passwordController;

  String? username = '';
  String? password = '';

  @override
  void onInit() {
    super.onInit();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  String? validateUsername(String value) {
    if (value.length < 6) {
      return 'กรุณาระบุให้ครบ';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return 'กรุณาระบุให้ครบ';
    }
    return null;
  }

  void LoginChecker() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    formKey.currentState!.save();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    usernameController.dispose();
    passwordController.dispose();
  }
}
