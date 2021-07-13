import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget{
  final String orderId;
  SuccessPage({required this.orderId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Success Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Success",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
            SizedBox(height: 10.0,),
            Text("Order Id: ${orderId}",style: TextStyle(fontSize: 20.0),),
          ],
        ),
      ),
    );
  }
}