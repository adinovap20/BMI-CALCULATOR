import 'package:flutter/material.dart';

void main(){
  runApp(BmiApp());
}

class BmiApp extends StatefulWidget{
  @override
  _BmiAppState createState() => _BmiAppState();
}

class _BmiAppState extends State<BmiApp>{
  double height,weight,bmi;
  String status='';
  String response = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xfffffbde),
        appBar: AppBar(title: Center(child: Text('BMI Calculator')),backgroundColor: Colors.orange,),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
              ),
              child: Text('The BMI (Body Mass Index) depends on height and weight and is used to broadly categorize a person as underweight, normal weight, overweight, or obese.',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold)),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your height in cms',

                ),
                onChanged: (value){
                  height = double.parse(value);
                },
              ),
            ),

            //Text('Enter your Weight in kg',style: TextStyle(fontSize: 20),),
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your weight in kg',

                ),
                onChanged: (value){
                  weight = double.parse(value);
                },
              ),
            ),
            /*
            FlatButton(
              color: Colors.greenAccent,
              child: Text('Calculate My Body-Mass-Index',style: TextStyle(color: Colors.black,fontSize: 16),),
              onPressed: (){
                  setState(() {
                    bmi = weight*100*100/(height * height);
                    if (bmi < 18) {
                      status = 'Underweight';
                    } else if (bmi < 25) {
                      status = 'Normal';
                    } else if (bmi < 30) {
                      status = 'Overweight';
                    } else {
                      status = 'Obese';
                    }
                  });
              }
            ),
            */
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                color: Colors.green,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue)),
                onPressed: () {
                  setState(() {
                    bmi = weight*100*100/(height * height);
                    if (bmi < 18) {
                      status = 'Underweight';
                    } else if (bmi < 25) {
                      status = 'Normal';
                    } else if (bmi < 30) {
                      status = 'Overweight';
                    } else {
                      status = 'Obese';
                    }
                  });
                  response = 'Your Body-Mass-Index is ${bmi.toString()}\n\nYou are $status.';
                },
                child: Text('Calculate Body-Mass-Index'),
              ),
            ),
            Text('$response',style: TextStyle(fontSize: 20,color: Colors.brown),textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}