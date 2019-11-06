import 'package:flutter/material.dart';

import 'package:english_words/english_words.dart';
import 'package:flutter_app/widget/first_demo.dart';
import 'package:flutter_app/widget/form_widget.dart';
import 'widget/my_dialog.dart';
import 'widget/my_anim.dart';
import 'widget/my_save.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.maxFinite,
              child:RaisedButton(onPressed:(){
                _goTo(FirstApp());
              },child: Text('FirstDemo'),),
            ),

            Container(
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  _goTo(FormWidget());
                },child: Text('基础控件'),)
            ),

            Container(
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  _goTo(MyDialog());
                },child: Text('对话框'),)
            ),

            Container(
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  _goTo(MyAnim());
                },child: Text('动画'),)
            ),

            Container(
                width: double.maxFinite,
                child: RaisedButton(onPressed:(){
                  _goTo(MySave(storage: TextStorage(),));
                },child: Text('存储'),)
            ),

          ],
        ),
      )
    );
  }

  _goTo(Widget key){
    Navigator.of(context).push(MaterialPageRoute(builder: (_){
      return key;
    }));
  }
}