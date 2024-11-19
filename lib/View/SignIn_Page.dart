import 'package:flutter/material.dart';
import 'package:flutter_exam/View/Home_Page.dart';
import 'package:flutter_exam/View/SignUp_Page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/attendance_controller.dart';
import '../Services/Auth_Services.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(AttendanceController());
    return Scaffold(
      appBar: AppBar(
        title: Text('SignIn Page'),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller.txtEmail,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                labelText: 'Email'
            ),
          ).marginSymmetric(horizontal: 15,vertical: 10),
          TextField(
            controller: controller.txtPassword,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                labelText: 'Password'
            ),
          ).marginSymmetric(horizontal: 15,vertical: 10),
          FilledButton(onPressed: () async {
            String email=controller.txtEmail.text;
            String password=controller.txtPassword.text;
            await AuthServices.authServices.signInAccount(email, password);
            controller.txtEmail.clear();
            controller.txtPassword.clear();
            Get.to(HomePage());
          }, child: Text('SignIn')),
          TextButton(onPressed: () {
            controller.txtEmail.clear();
            controller.txtPassword.clear();
            Get.to(SignupPage());
          }, child: Text("Don't have acc!SignUp")),
        ],
      ),
    );
  }
}
