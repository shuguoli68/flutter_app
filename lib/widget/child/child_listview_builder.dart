import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ChildListViewBuilder extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ChildListViewBuilder();
}

class _ChildListViewBuilder extends State<ChildListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(5.0),
          itemExtent: 50,
          itemBuilder: (context,index){
            return ListTile(
              onTap: (){
                Toast.show('点击了$index', context,gravity: Toast.TOP);
              },
              onLongPress: (){
                Toast.show('长按了$index', context,gravity: Toast.TOP);
              },
              title: Text('itemText$index', style: TextStyle(backgroundColor: Colors.blueAccent),),
              trailing: Icon(Icons.keyboard_arrow_right),
              leading: Icon(Icons.ac_unit),
            );
          }),
    );
  }
}