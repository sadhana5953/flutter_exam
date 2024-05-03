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

      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        actions: [
          Container(
            height: 50,
            width: 350,
            margin: EdgeInsets.only(top: 10, right: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintText: 'search your product',
                  suffixIcon: GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushNamed('/cart');
                    },
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.grey,
                    ),
                  ),
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50))),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Wrap(
            children: List.generate(
                product.length,
                    (index) => GestureDetector(
                  onTap: (){
                    selectedIndex=index;
                    Navigator.of(context).pushNamed('/detail');
                  },
                  child: product_list(name: product[index]['name'], price: product[index]['price'], img: product[index]['image'])
                )),
          ),
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
                Text("$name\n⭐⭐⭐⭐\n$price/-",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
              ],),
            );
  }
}
