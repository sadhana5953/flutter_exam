import 'package:flutter/material.dart';
import 'package:flutter_exam/Controller/attendance_controller.dart';
import 'package:flutter_exam/Services/Auth_Services.dart';
import 'package:flutter_exam/View/SignIn_Page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(AttendanceController());
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp Page'),
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
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
              labelText: 'Phone'
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
          TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
              labelText: 'Confirm Password'
            ),
          ).marginSymmetric(horizontal: 15,vertical: 10),
          FilledButton(onPressed: () async {
            String email=controller.txtEmail.text;
            String password=controller.txtPassword.text;
            await AuthServices.authServices.createAccount(email, password);
            controller.txtEmail.clear();
            controller.txtPassword.clear();
            Get.to(SigninPage());
          }, child: Text('SignUp')),
          TextButton(onPressed: () {
            controller.txtEmail.clear();
            controller.txtPassword.clear();
            Get.to(SigninPage());
          }, child: Text("Already have acc! SignIn")),
        ],
      ),
    );
  }
}
