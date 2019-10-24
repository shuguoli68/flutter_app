import 'package:flutter/material.dart';

import 'package:english_words/english_words.dart';
import 'package:flutter_app/widget/first_demo.dart';
import 'package:flutter_app/widget/form_widget.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: new MainApp(),
    );
  }
}

class MainApp extends StatefulWidget{
    @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MainAppState();
  }
}

class MainAppState extends State<MainApp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter学习'),
      ),
      body: new Scaffold(
          body: Center(
            child: Column(
              children: <Widget>[
                new RaisedButton(onPressed:(){
                  _goTo(FirstApp());
                },child: Text('FirstDemo'),)
                ,
                new RaisedButton(onPressed:(){
                  _goTo(FormWidget());
                },child: Text('基础控件'),)
              ],
            ),
          )
      ),
    );
  }

  _goTo(Widget key){
    Navigator.of(context).push(MaterialPageRoute(builder: (_){
      return key;
    }));
  }
}