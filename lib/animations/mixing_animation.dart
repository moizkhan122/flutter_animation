import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class animate7 extends StatefulWidget {
  const animate7({Key? key}) : super(key: key);

  @override
  State<animate7> createState() => _animate7State();
}

class _animate7State extends State<animate7> with SingleTickerProviderStateMixin {

  @override
  late Animation animation;
  late AnimationController animationController;

  void initState(){
    super.initState();

    animationController = AnimationController(vsync: this,duration: Duration(seconds: 2));

    animation = Tween(begin: 0.0, end: -0.15).animate(
      CurvedAnimation(
        parent: animationController,
         curve: Curves.ease));
  }

  @override
  Widget build(BuildContext context) {
    final Width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
       builder:(BuildContext context, widget){
      return new Scaffold(
        body: Center(
          child: Stack(
            children: [
              Center(
                child: Container(
                  
                  height: 350,
                  width: 200,
                  decoration: BoxDecoration(
                    //color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      
                      RaisedButton(onPressed: (){}, child: Text("show",style: TextStyle(fontSize: 20),),
                      textColor: Colors.white,
                      color: Colors.green,
                      ),
                      SizedBox(width: 10,),
                      RaisedButton(onPressed: (){}, child: Text("hide",style: TextStyle(fontSize: 20),),
                      textColor: Colors.white,
                      color: Colors.green,
                      ),
                      ]),
                ),
                ),
                Center(
                  child: GestureDetector(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                    height: 350,
                    width: 200,
                    decoration: BoxDecoration(
                      //color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(image: AssetImage("assets/moiz.jpg"),fit: BoxFit.cover
                    ),
                    ),

                          transform: Matrix4.translationValues(0.0, animation.value*Width, 0.0),
                  ),
                  onTap: (){animationController.forward();},
                  onDoubleTap: (){animationController.reverse();},
                  )),
            ],
          ),
        ),
      );
    });
  }
}