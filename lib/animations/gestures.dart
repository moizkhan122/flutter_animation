import 'package:flutter/material.dart';

class gesturee extends StatefulWidget {
  const gesturee({Key? key}) : super(key: key);

  @override
  State<gesturee> createState() => _gestureState();
}

class _gestureState extends State<gesturee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("gextures")),
      body: Center(                    //gesturedet is for detect a task for another task perform
        child: InkWell(onTap: () {  //gesturedetector/inkwell both are like same widget for same task 
          print("Moiz Khan");       //diff is only that inkwell dont need color in it transparent shadoz color innit
        },
        child: Container(
          height: 80,
          width: 130,
          
          decoration: BoxDecoration(
            //color: Colors.green,
            borderRadius: BorderRadius.circular(10)),
        child: Center(child: Text("click me")),
        ),
        )
        ),
    );
  }
}