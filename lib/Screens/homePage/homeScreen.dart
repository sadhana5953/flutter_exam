import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_exam/utills/list.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 50,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: 'search your product',
                    suffixIcon: GestureDetector(
                      onTap: (){
                        Navigator.of(context).pushNamed('/cart');
                      },
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                    hintStyle: TextStyle(color: Colors.white)),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Wrap(
                children: List.generate(product.length, (index) => GestureDetector(
                  onTap: (){
                    selectedIndex=index;
                    Navigator.of(context).pushNamed('/detail');
                  },
                    child: product_list(name: product[index]['name'], price: product[index]['price'], img: product[index]['image'])),)
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container product_list({required String name,required int price,required String img}) {
    return Container(
              height: 200,
              width: 175,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(30),
                //image: DecorationImage(image: AssetImage("")),
              ),
              child: Column(children: [
                Container(
                  height: 90,
                  width: 170,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(image: AssetImage(img)),
                      borderRadius: BorderRadius.circular(15)
                  ),
                ),
                Text("$name\n⭐⭐⭐⭐⭐\n$price/-",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
              ],),
            );
  }
}
