import 'package:animations/animations/hero_animation/page2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:matcher/matcher.dart';

class page1 extends StatefulWidget {
  page1({Key? key}) : super(key: key);

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
      appBar: AppBar(title: Text("Hero  animation"),),
        body: ListView.builder(itemBuilder: (context ,index){
        return Hero(
          tag:  "page#$index",
          child: ListTile(
            title: Text("task#$index"),
            onTap: (){
              Navigator.push(context, myroutes(builder: ((context) => page2(index))));
            },
          ),
        );
      }),
      ),
    );
  }
}
class myroutes extends MaterialPageRoute{
      myroutes({required WidgetBuilder builder}) : super (builder : builder);
      
      @override
      Duration get transitionDuration => Duration(seconds: 5);
 }