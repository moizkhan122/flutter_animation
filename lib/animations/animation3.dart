import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class animate3 extends StatefulWidget {
  const animate3({Key? key}) : super(key: key);

  @override
  State<animate3> createState() => _animate3State();
}

class _animate3State extends State<animate3>with SingleTickerProviderStateMixin {

 late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState(){
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      );

                //tween gives the input/output ranges of given animation
                          //form will be on center
    animation = Tween(
      begin: (-1.0),
       end:(0.0),
      ).animate(animationController.view);
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            FadeTransition(
              opacity : animation,
              child: Container( 
                height: 150,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green
                ),
              ),
            ),
             SizedBox(height: 13,),
            ElevatedButton(onPressed: (){
              animationController.forward();
            }, child: Text("shows")),
            SizedBox(height: 13,),
            ElevatedButton(onPressed: (){
              animationController.reverse();
            }, child: Text("hide")),
          ],),
        )),
    );
  }
}