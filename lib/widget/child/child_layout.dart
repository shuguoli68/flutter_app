import 'package:flutter/material.dart';

class ChildLayout extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ChildLayout();

}

class _ChildLayout extends State<ChildLayout>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text('1、Row:'),
            ),
            Row(
              children: <Widget>[
                Text('one',style: TextStyle(backgroundColor: Colors.blue),),
                Text('two',style: TextStyle(backgroundColor: Colors.green),),
                Text('three',style: TextStyle(backgroundColor: Colors.red),),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text('2、Column:'),
            ),
            Column(
              children: <Widget>[
                Text('one',style: TextStyle(backgroundColor: Colors.blue),),
                Text('two',style: TextStyle(backgroundColor: Colors.green),),
                Text('three',style: TextStyle(backgroundColor: Colors.red),),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text('3、Container:'),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.amber, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('one',style: TextStyle(backgroundColor: Colors.blue),),
                  Text('two',style: TextStyle(backgroundColor: Colors.green),),
                  Text('three',style: TextStyle(backgroundColor: Colors.red),),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text('4、Expanded:  1:2:1'),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.amber, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Text('one',style: TextStyle(backgroundColor: Colors.blue),textAlign: TextAlign.center,),
                    flex: 1,
                  ),
                  Expanded(
                    child: Text('two',style: TextStyle(backgroundColor: Colors.green),textAlign: TextAlign.center,),
                    flex: 2,
                  ),
                  Expanded(
                    child: Text('three',style: TextStyle(backgroundColor: Colors.red),textAlign: TextAlign.center,),
                    flex: 1,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text('5、Stack:'),
            ),
            Stack(
//              alignment: Alignment(0.8, 0.8),
              children: <Widget>[
                Text('one',style: TextStyle(backgroundColor: Colors.blue,height: 15),),
                Text('two',style: TextStyle(backgroundColor: Colors.green,height: 10),),
                Text('three',style: TextStyle(backgroundColor: Colors.red,height: 5),),
              ],
            )

          ],
        ),
      ),
    );
  }
}