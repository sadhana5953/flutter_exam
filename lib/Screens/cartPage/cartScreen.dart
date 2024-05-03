import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_exam/utills/list.dart';

class cartScreen extends StatefulWidget {
  const cartScreen({super.key});

  @override
  State<cartScreen> createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Screen'),
      ),
      body: Center(
          child: Column(children: [
        Expanded(
          child: Container(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: List.generate(
                cartList.length,
                    (index) => cart_list(
                    name: cartList[index]['name'],
                    price: cartList[index]['price'],
                    index: index,
                    img: cartList[index]['image']),
              ),),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            for(int i=0;i<cartList.length;i++)
            {
              amount=cartList[i]['price'];
            }
            gst=(amount*18/100);
            total=gst+amount;
            Navigator.of(context).pushNamed('/checkout');
          },
          child: Container(
            height: 60,
            width: 300,
            margin: EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(25)
            ),
            alignment: Alignment.center,
            child: Text("Checkout",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
          ),
        )
      ])),
    );
  }

  Container cart_list(
      {required String name,
      required int price,
      required int index,
      required String img}) {
    return Container(
      height: 170,
      width: 350,
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.green.shade100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(image: AssetImage(img)),
            ),
          ),
          Text(
            '$name\n$price/-\n',
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                cartList.removeAt(index);
              });
            },
            child: Icon(
              Icons.delete,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
