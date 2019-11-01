import 'package:flutter/material.dart';
import 'child/child_text.dart';
import 'child/child_image.dart';
import 'child/child_textfiled.dart';
import 'child/child_button.dart';
import 'child/child_layout.dart';
import 'child/child_listview.dart';
import 'child/child_listview_builder.dart';
import 'child/child_listview_separated.dart';

class FormWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _FormWidget();
}

class _FormWidget extends State<FormWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('基础控件'),
      ),
      body: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              new RaisedButton(onPressed:(){
                _goTo(ChildText());
              },child: Text('Text'),padding: const EdgeInsets.all(10.0),)
              ,
              new RaisedButton(onPressed:(){
                _goTo(ChildImage());
              },child: Text('Image'))
              ,
              new RaisedButton(onPressed:(){
                _goTo(ChildTextFiled());
              },child: Text('TextFiled'))
              ,
              new RaisedButton(onPressed:(){
                _goTo(ChildButton());
              },child: Text('Button'))
              ,
              new RaisedButton(onPressed:(){
                _goTo(ChildLayout());
              },child: Text('Layout'))
              ,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new RaisedButton(onPressed:(){
                    _goTo(ChildListView());
                  },child: Text('ListView'))
                  ,
                  new RaisedButton(onPressed:(){
                    _goTo(ChildListViewSeparated());
                  },child: Text('separated'))
                  ,
                  new RaisedButton(onPressed:(){
                    _goTo(ChildListViewBuilder());
                  },child: Text('builder'))
                  ,
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  _goTo(Widget key){
    Navigator.of(context).push(MaterialPageRoute(builder: (_){
      return key;
    }));
  }
}

