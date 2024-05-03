import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam/utills/list.dart';

class detailScrren extends StatefulWidget {
  const detailScrren({super.key});

  @override
  State<detailScrren> createState() => _detailScrrenState();
}

class _detailScrrenState extends State<detailScrren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dettail"),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage(product[selectedIndex]['image'])),
            ),
          ),
          Container(
            height: 540,
            width: double.infinity,
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.only(top: 20),
            color: Colors.green.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${product[selectedIndex]['name']}\n⭐⭐⭐⭐⭐\nprice: ${product[selectedIndex]['price']}/-',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Text(
                  '\nThe fruit is vibrant and juicy fruit , known for its refreshing flavour and bright color. With a tangy savoury sweetness, it add a burst of freshness',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                GestureDetector(
                  onTap: (){
                    cartList.add(product[selectedIndex]);
                  },
                  child: Container(
                    height: 60,
                    width: 300,
                    margin: EdgeInsets.only(top: 50,left: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.green,
                    ),
                    alignment: Alignment.center,
                    child: Text("Add to Cart",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
