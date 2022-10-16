import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class animate10 extends StatefulWidget {
  const animate10({Key? key}) : super(key: key);

  @override
  State<animate10> createState() => _animate10State();
}

class _animate10State extends State<animate10> {
  bool toggleValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: 40,
          width: 100,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          color: toggleValue ? Colors.green : Colors.red,
          ),
          child: Stack(
            children: [
              AnimatedPositioned(duration: Duration(milliseconds: 1000),
              curve: Curves.easeIn,
              top: 3.0,
              left: toggleValue ?60.0 : 0,
              right: toggleValue ?0 : 60.0,

              child: InkWell(
                onTap :toggleButton,
                child: AnimatedSwitcher(duration:Duration(milliseconds: 1000),
                transitionBuilder: (Widget child ,Animation<double> animation){
                   return RotationTransition( child: child ,turns: animation);
                  
                },
                 child : toggleValue ? Icon(Icons.check_circle,color: Colors.greenAccent[100],size: 35.0,
                   key: UniqueKey(),
                   ): Icon(Icons.remove_circle_outline,color: Colors.redAccent[100],size: 35.0,
                   key: UniqueKey()),
                 ),
              ),
              )
            ],
          ),
          ),
      ),
    );



  }
  toggleButton(){
    setState(() {
      toggleValue = !toggleValue;
    });
  }
}