import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class futures extends StatefulWidget {
  const futures({Key? key}) : super(key: key);

  @override
  State<futures> createState() => _futuresState();
}

class _futuresState extends State<futures> {

  var url ="https://api.publicapis.org/entries";
  //function for getting a data and show
  getdata() async {
    var responce = await http.get(Uri.parse(url));
    var data = json.decode(responce.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getdata(), //its like from where we have load a data
        builder: (context, dynamic Snapshot){
          if(Snapshot.hasData){
            return ListView.builder(
              itemCount: Snapshot.data['entries'].length, //getting all data from 0th index
              itemBuilder: (context,index){
              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text("${(Snapshot.data['entries'][index]['API'])}"),
                  subtitle: Text("${(Snapshot.data['entries'][index]['Description'])}"),
                ),
              );
            });
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        }), //snapshot copy of a data
    );
  }
}