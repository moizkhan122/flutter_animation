import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class animate5 extends StatefulWidget {
  const animate5({Key? key}) : super(key: key);

  @override
  State<animate5> createState() => _animate5State();
}

class _animate5State extends State<animate5> with SingleTickerProviderStateMixin {

  @override
  late Animation animation , tranformAnimation;
  late AnimationController animationController;

  void initState(){
    super.initState();

    animationController = AnimationController(vsync: this,duration: Duration(seconds: 8));

    animation = Tween(begin: 10.0,end :200.0).animate(
      CurvedAnimation(
        parent: animationController,
         curve: Curves.ease));

          tranformAnimation = BorderRadiusTween(
            begin: BorderRadius.circular(125.0),
            end: BorderRadius.circular(0.0)).animate(CurvedAnimation(
              parent: animationController,
               curve: Curves.ease));        
               animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
       builder:(BuildContext context, widget){
      return new Scaffold(
        body: Center(
          child: Stack(
            children:[
                          Center(
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              height: animation.value,
                              width: animation.value,
                              decoration: BoxDecoration(
                                borderRadius: tranformAnimation.value,
                                image: DecorationImage(image: AssetImage("assets/moiz.jpg")),
                              ),
                            ),
                          ),
          ]),
        ),
      );
    });
  }
}