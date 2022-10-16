

import 'package:flutter/material.dart';

class animate4 extends StatefulWidget {
  const animate4({Key? key}) : super(key: key);

  @override
  State<animate4> createState() => _animate4State();
}

class _animate4State extends State<animate4> with SingleTickerProviderStateMixin{

  late Animation<double> animation , childanimation;
  late AnimationController animationController;

  void initState(){
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
      ); 

      animation = Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
          parent: animationController, curve: Curves.easeIn));

          childanimation = Tween(begin: 20.0, end: 125.0).animate(
            CurvedAnimation(
              parent: animationController,
               curve: Curves.easeIn)
          );
    }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    animationController.forward();
    
    return AnimatedBuilder(
      animation: animationController,
       builder:(BuildContext context, Widget){
        return Scaffold(
          body: Align(
            alignment: Alignment.center,
            child: Container(
              child: Transform(
                    transform: Matrix4.translationValues(
                      animation.value *width, 0.0, 0.0),
                    child: new Center(
                      child: AnimatedBuilder(
                        animation: childanimation,
                        builder: (BuildContext context, Widget){
                          return new Center(
                            child: Container(
                              padding: EdgeInsets.all(5.0),
                              height: childanimation.value *3,
                              width: childanimation.value *2,

                              child: ListView(
                                children:[
                                TextFormField(decoration: InputDecoration(hintText: "username"),),
                                SizedBox(height: 13,),

                                TextFormField(obscureText: true,decoration: InputDecoration(hintText: "username"),),
                                SizedBox(height: 15,),

                                RaisedButton(onPressed: (){}, child: Text("submits"),color: Colors.green,elevation: 7.0,textColor: Colors.white,),
                                SizedBox(height: 10,),
                                    Center(child: Text("dont have an account",style: TextStyle(color: Colors.green),)),
                                    SizedBox(height: 10,),
                                 OutlinedButton(
                               style: OutlinedButton.styleFrom(
                               backgroundColor: Colors.white,
                              primary: Colors.green,
                              side: BorderSide(color: Colors.green, width: 5), //<-- SEE HERE
                               ),
                                onPressed: () {},
                                  child: const Text(
                                'sign up',
                                  style: TextStyle(fontSize: 20),),)

                              ],)
                            ),
                          );
                        },
                      ),
                    ),
                  ),
            ),
          ),
        );
       } );
  }
}