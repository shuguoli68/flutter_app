import 'package:flutter/material.dart';

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
              new RaisedButton(onPressed:null,child: Text('Text'),padding: const EdgeInsets.all(10.0),)
              ,
              new RaisedButton(onPressed:null,child: Text('Image'))
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

