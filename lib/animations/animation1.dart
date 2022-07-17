import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class animate1 extends StatefulWidget {
  const animate1({Key? key}) : super(key: key);

  @override
  State<animate1> createState() => _animate1State();
}

class _animate1State extends State<animate1> with SingleTickerProviderStateMixin{

  late Animation<Offset>  animation;
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
      begin: const Offset(-10.0,0),
       end: const Offset(0,0),
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
              SlideTransition(
                position: animation,
                child: Container(width: 200,height: 200,color: Colors.black,)),

              ElevatedButton(onPressed: (){
                animationController.forward();
              }, child: Text("show"),),
              ElevatedButton(onPressed: (){
                animationController.reverse();
              }, child: Text("hide"),),
            ],),
      ),
      ),
    );
  }       //FadeTransition = visible/unvisible
          //ScaleTransition = size increase/decrease
}