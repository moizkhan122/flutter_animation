
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class animate2 extends StatefulWidget {
  const animate2({Key? key}) : super(key: key);

  @override
  State<animate2> createState() => _animate2State();
}

class _animate2State extends State<animate2> with SingleTickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController animationController;

  void initState(){
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      ); 
      animation = Tween(begin: -1.0,end: 0.0).animate(
        CurvedAnimation(
          parent: animationController, curve: Curves.bounceIn));
          animationController.forward();
    }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: animationController,
       builder: (BuildContext context, Widget){
        return Scaffold(
          body: Transform(
            transform: Matrix4.translationValues(animation.value *width, 0.0, 0.0),
            child: new Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),

                      Padding(
                        padding: const EdgeInsets.only(right: 40,left: 40),
                        child: TextFormField(decoration: const InputDecoration(
                            hintText: 'enter user name',
                        ),),
                      ),
                      SizedBox(height: 10,),
                      //2
                      Padding(
                        padding: const EdgeInsets.only(right: 40,left: 40),
                        child: TextFormField(decoration: const InputDecoration(
                            hintText: 'enter password',
                        ),),
                      ),
                               SizedBox(height: 15,),
                      ElevatedButton(onPressed: (){}, child: Text("submit")),
                      Text("Dont have an Account?",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        SizedBox(height: 20,),
                    ElevatedButton(onPressed: (){}, child: Text("SIGNUP"),
                    
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
       }
       );
  }
}