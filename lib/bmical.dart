import 'dart:math';

import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  const Bmi({Key? key}) : super(key: key);

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {

bool cont = true;

double _weight=30.0;
int _age=1;
double result = 0;
double _height = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.home),
        title: Center(child: Text("Bmi Calculator")),
        actions: [
          Icon(Icons.search)
        ],
      ),
      body: Column(

        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                 Expanded(

                   child: GestureDetector(
                     onTap: () {
                       setState(() {
                         cont=true;
                       });

                     },
                     child: Container(
                            decoration:BoxDecoration(color: cont?Colors.cyan:Color.fromRGBO(37, 38, 38, 1),borderRadius: BorderRadius.circular(20)) ,
                            
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                Icon(Icons.male,size: 150,color: Colors.white,),
                                Text("Male",style: TextStyle(fontSize: 30,color: Colors.white),),
                              ]),

                 ),
                   ),),
                    SizedBox(width: 20,),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          cont=false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: !cont?Colors.purpleAccent:Color.fromRGBO(37, 38, 38, 1),),
                        
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              Icon(Icons.female,size: 150,color: Colors.white,),
                              Text("Female",style: TextStyle(fontSize: 30,color: Colors.white),),
                            ]),

                      ),
                    ),),
                ],
              ),
            )
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
            child:Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color.fromRGBO(37, 38, 38, 1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Height",style: TextStyle(fontSize: 20,color: Colors.white),),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("$_height",style: TextStyle(fontSize: 30,color: Colors.white),),
                      Text("CM",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
                    ],
                  ),
                  SizedBox(height: 10,),
                  Slider(max:300,min:1,value: _height, onChanged: (value) {
                    setState(() {
                      _height = value.roundToDouble();
                    });
                  },
                    thumbColor: Colors.redAccent,
                    activeColor: Colors.white,
                  )
                ],
              ),

            ),
            )
          ),
          Expanded(
            child:
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color.fromRGBO(37, 38, 38, 1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Weight",style: TextStyle(fontSize: 30,color: Colors.white),),
                          Text("$_weight",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  _weight++;
                                });

                              },
                                heroTag:"weight+",
                                child: Icon(Icons.add),mini: true,backgroundColor: Colors.greenAccent,),
                              SizedBox(width: 20,),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  _weight--;
                                });
                              },heroTag: 'weight-',
                                  child: Icon(Icons.remove),mini: true,backgroundColor: Colors.redAccent),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  ///////////
                  Expanded(
                    child:
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color.fromRGBO(37, 38, 38, 1)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Age",style: TextStyle(fontSize: 30,color: Colors.white),),
                        Text("$_age",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(onPressed: (){
                              setState(() {
                                _age++;
                              });
                            },
                              heroTag: 'age+',
                              child: Icon(Icons.add),mini: true,backgroundColor: Colors.greenAccent,),
                            SizedBox(width: 20,),
                            FloatingActionButton(onPressed: (){
                              setState(() {
                                _age--;
                              });
                            },heroTag: 'age-',
                                child: Icon(Icons.remove),mini: true,backgroundColor: Colors.redAccent),
                          ],
                        )
                      ],
                    ),
                  ),
                  )
                ],
              ),
            )
          ),
          Container(
            width: double.infinity,
            child:MaterialButton(onPressed: (){
              result=_weight/pow(_height/100, 2);
              print(result.round());
              Navigator.push
                (
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result( _age, result.round(), cont),
                  )
              );
            },
              height: 50,
              child: Text("CALCULATE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),color: Colors.blueAccent,))

        ],
      ),
    );
  }
}
