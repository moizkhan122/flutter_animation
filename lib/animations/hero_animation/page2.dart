

import 'package:flutter/material.dart';

class page2 extends StatefulWidget {
   final int index ;
  const page2(this.index,{Key? key}) : super(key: key);

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  @override
  Widget build(BuildContext context) {
          return Hero(
              tag:  "page#${widget.index}",
            child: Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("moiz",style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: (){
                        Navigator.pop(context);
                    }, child: Text("go back",style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.bold)))
                  ],
                ),
              ),
            ),
          );   
  }
}