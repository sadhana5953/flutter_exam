import 'package:flutter/material.dart';
import 'package:flutter_exam/Screens/cartPage/cartScreen.dart';
import 'package:flutter_exam/Screens/checkPage/checkoutScreen.dart';
import 'package:flutter_exam/Screens/detailPage/detailScreen.dart';
import 'package:flutter_exam/Screens/homePage/homeScreen.dart';
void main()
{
  runApp(exam(),);
}
class exam extends StatelessWidget {
  const exam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) =>homeScreen(),
        '/detail':(context) => detailScrren(),
        '/cart':(context) => cartScreen(),
        '/checkout':(context) => checkoutscreen(),
      },
    );
  }
}
