import 'package:flutter/material.dart';
import 'package:flutter_exam/utills/list.dart';
class checkoutscreen extends StatefulWidget {
  const checkoutscreen({super.key});

  @override
  State<checkoutscreen> createState() => _checkoutscreenState();
}

class _checkoutscreenState extends State<checkoutscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout Screen"),
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
            child: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(children: [
            Container(
              height: 150,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.green.shade300,
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.centerLeft,
              child: Text("     Amount: $amount\n     Gst: $gst\n     Total: $total",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            ElevatedButton(onPressed: (){
              showDialog(context: context, builder: (BuildContext context){
               return AlertDialog(
                 title: Text("Payment Massage"),
                 content: Text("payment is done",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                 actions: [
                   OutlinedButton(onPressed: (){
                     Navigator.of(context).pop();
                   }, child: Text("ok",style: TextStyle(fontSize: 20),))
                 ],
               );
              });
            }, child: Container(
              height: 60,
              width: 200,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.green.shade300,
              ),
              alignment: Alignment.center,
              child: Text("pay $total",style: TextStyle(color: Colors.white,fontSize: 20),),
            ))
          ],),
        ),
      ),
    );
  }
}
