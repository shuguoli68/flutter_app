import 'package:flutter/material.dart';

class MyAnim extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyAnim();
}

class _MyAnim extends State<MyAnim>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('Flutter动画分为两类：'),
          ),
          Container(
            width: double.maxFinite,
            child: RaisedButton(onPressed: (){

            },child: Text('补间动画 Tween Animation'),),
          ),
          Container(
            width: double.maxFinite,
            child: RaisedButton(onPressed: (){

            },child: Text('基于物理的动画 Physics-based Animation'),),
          ),


          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('三种动画模式：'),
          ),
          Container(
            width: double.maxFinite,
            child: RaisedButton(onPressed: (){
              
            },child: Text('list、grid中的动画 Animated list or grid'),),
          ),
          Container(
            width: double.maxFinite,
            child: RaisedButton(onPressed: (){
              
            },child: Text('转场动画 Shared element transition'),),
          ),
          Container(
            width: double.maxFinite,
            child: RaisedButton(onPressed: (){
              
            },child: Text('交错动画 Staggered animation'),),
          ),

        ],
      ),
    );
  }
}