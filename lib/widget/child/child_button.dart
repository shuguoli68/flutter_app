import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ChildButton extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ChildButton();

}

class _ChildButton extends State<ChildButton> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Button'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MaterialButton(
              color: Colors.green,
              textColor: Colors.white,
              child: Text('MaterialButton'),
              onPressed: (){
                Toast.show('点击MaterialButton', context,gravity: Toast.TOP);
              },
            ),

            RaisedButton(
              child: Text('RaisedButton'),
              onPressed: (){
                Toast.show('点击RaisedButton', context,gravity: Toast.TOP);
            },),

            FlatButton(
                onPressed: (){
                  Toast.show('点击FlatButton', context,gravity: Toast.TOP);
                },
                child: Text('FlatButton')
            ),

            IconButton(icon: Icon(Icons.settings), onPressed: (){
              Toast.show('点击IconButton', context,gravity: Toast.TOP);
            }),

//            ButtonBar(
//              children: <Widget>[
//                CloseButton(),
//                BackButton(),
//                ChildButton()
//              ],
//            ),

            FloatingActionButton(
              child: Icon(Icons.add_location),
              elevation: 3,
              highlightElevation: 2,
              backgroundColor: Colors.green,
              onPressed: (){
                Toast.show('点击FloatingActionButton', context,gravity: Toast.TOP);
              },
            ),
          ],
        ),
      ),
    );
  }
}