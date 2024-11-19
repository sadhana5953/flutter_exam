import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam/Services/Auth_Services.dart';
import 'package:flutter_exam/View/Home_Page.dart';
import 'package:flutter_exam/View/SignUp_Page.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
//
// firebase_core: ^3.8.0
// get: ^4.6.6
// firebase_auth: ^5.3.3
// sqflite: ^2.4.1
// path_provider: ^2.1.5
// cloud_firestore: ^5.5.0

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

