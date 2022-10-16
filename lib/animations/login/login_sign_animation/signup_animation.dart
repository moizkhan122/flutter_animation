

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class animate9 extends StatefulWidget {
  const animate9({Key? key}) : super(key: key);

  @override
  State<animate9> createState() => _animate9State();
}

class _animate9State extends State<animate9>with SingleTickerProviderStateMixin {
 
 late Animation animation, delayanimation, muchdelayanimation;
 late AnimationController animationController;
  
   @override
  void initState(){
    super.initState();
    animationController = AnimationController(vsync: this,
    duration: Duration(seconds: 2),
    );
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn));

     delayanimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: animationController, curve: Interval(0.4,1.0,curve: Curves.fastOutSlowIn)));

      muchdelayanimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Interval(0.8,1.0,curve: Curves.fastOutSlowIn)));
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    animationController.forward();

    return AnimatedBuilder(animation: animationController, builder: (BuildContext context ,widget){
      return Scaffold(
       resizeToAvoidBottomInset: false,
       body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //1
          Container(
            child: Stack(
              children: [
                Transform(
                  transform: Matrix4.translationValues(animation.value*width, 0.0, 0.0),
                  child: Container(height: 300,width: width,
                   child: Center(child: Text("SignUp..",
                   style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold,color: Colors.green)
                   ,)),)),
              ],
            ),
          ),
        //2
        Transform(
          transform: Matrix4.translationValues(delayanimation.value*width, 0.0, 0.0),
          child: Container(
                    height: 200,
                    width: width,
                    //color: Colors.deepOrange,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 25,left: 25,top: 0,bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextFormField(decoration: InputDecoration(hintText: "Email"),),
                          SizedBox(height: 10,),
                          TextFormField(decoration: InputDecoration(hintText: "Nickname"),),
                          SizedBox(height: 10,),
                          TextFormField(decoration: InputDecoration(hintText: "Password"),),
                        ],
                      ),
                    ),
                  ),
        ),
                //3
                Transform(
                  transform: Matrix4.translationValues(muchdelayanimation.value*width, 0.0, 0.0),
                  child: Container(
                    height: 200,
                    width: width,
                    //color: Colors.deepOrange,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 25,left: 25,top: 0,bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                         SizedBox( 
                        height:50, //height of button
                            width:double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder( //to set border radius to button
                          borderRadius: BorderRadius.circular(20)
                            ),
                    primary: Colors.green, //background color of button
                   // side: BorderSide(width:3, color:Colors.brown), //border width and color
                    elevation: 10, //elevation of button
                              ),
                              onPressed: (){},
                              child: Text("Sign Up",style: TextStyle(fontSize: 22,color: Colors.white),)), //width of button equal to parent widget
                    ),
                    SizedBox(height: 8,),
                           InkWell(
                             child: SizedBox(
                              height:50, //height of button
                              width:double.infinity,
                               child: OutlinedButton(onPressed: (){
                                Navigator.pop(context);
                               },
                               style:  OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder( //to set border radius to button
                          borderRadius: BorderRadius.circular(20)
                            ),
                     //elevation of button
                              ),
                              
                                child: Text("Go Back..",style: TextStyle(fontSize: 18,color: Colors.green),)),
                             ),
                           ),
                        ],
                      ),
                    ),
                  ),
                ),
        ],
       ),
      );
    });
  }
}