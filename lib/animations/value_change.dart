import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class animate6 extends StatefulWidget {
  const animate6({Key? key}) : super(key: key);

  @override
  State<animate6> createState() => _animate6State();
}

class _animate6State extends State<animate6> with SingleTickerProviderStateMixin {

  @override
  late Animation animation;
  late AnimationController animationController;

  void initState(){
    super.initState();

    animationController = AnimationController(vsync: this,duration: Duration(seconds: 5));

    animation = IntTween(begin: 1,end :10).animate(
      CurvedAnimation(
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
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("....Value change Animation...",style: TextStyle(fontSize: 25),),
                SizedBox(height: 15,),
                Text("Number Loading.....",style: TextStyle(fontSize: 25),),
                Text(animation.value.toString(),style: TextStyle(fontSize: 40),),
              ],
            ),
          ),
        ),
      );
    });
  }
}