import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Login Tester',
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 10,
          ),
          Form(
              key: controller.formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      onSaved: (Value) => controller.username = Value,
                      controller: controller.usernameController,
                      decoration: inpoutdecuration(lable: 'Username 6 ตัว'),
                      validator: (value) {
                        return controller.validateUsername(value.toString());
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      onSaved: (value) {
                        controller.password = value;
                      },
                      controller: controller.passwordController,
                      decoration: inpoutdecuration(lable: 'Password 6 ตัว'),
                      validator: (value) {
                        return controller.validatePassword(value.toString());
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton.icon(
                      style: const ButtonStyle(
                          padding:
                              MaterialStatePropertyAll(EdgeInsets.all(20))),
                      onPressed: () {
                        controller.LoginChecker();
                        if (controller.formKey.currentState!.validate()) {
                          Get.offNamed('/home');
                        } else {
                          return;
                        }
                      },
                      icon: const Icon(Icons.login, color: Colors.white),
                      label: const Text(
                        'เข้าสู่ระบบ',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  InputDecoration inpoutdecuration({required String lable}) =>
      InputDecoration(label: Text(lable), border: OutlineInputBorder());
}
