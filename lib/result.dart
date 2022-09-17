import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int age;
  final int result;
  final bool cont;

  Result(this.age, this.result, this.cont);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("BMI Result "),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Gender:${cont?'Male':'Female'}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: cont?Colors.cyan:Colors.purpleAccent),),
            Text("Age:$age",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
            Text("Result:$result",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),)

          ],
        ),
      ),
    );
  }
}
