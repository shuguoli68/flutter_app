import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ChildListView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ChildListView();
}

class _ChildListView extends State<ChildListView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: Divider.createBorderSide(context,color: Colors.black,width: 1)
              ),
            ),
            child: ListTile(
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.keyboard_arrow_right),
              title: Text('设置'),
              onTap: (){
                Toast.show('点击了设置', context,gravity: Toast.TOP);
              },
              onLongPress: (){
                Toast.show('长按了设置', context,gravity: Toast.TOP);
              },
            ),
          ),

          Container(
            decoration: BoxDecoration(
//              color: Colors.green,
              border: Border(
                bottom: Divider.createBorderSide(context,color: Colors.black,width: 1)
              )
            ),
            child: ListTile(
              leading: Icon(Icons.help),
              trailing: Icon(Icons.keyboard_arrow_right),
              title: Text('帮助'),
              onTap: (){
                Toast.show('点击了帮助', context,gravity: Toast.TOP);
              },
              onLongPress: (){
                Toast.show('长按了帮助', context,gravity: Toast.TOP);
              },
            ),
          ),

          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: Divider.createBorderSide(context,color: Colors.black,width: 1)
              )
            ),
            child: ListTile(
              leading: Icon(Icons.remove_from_queue),
              trailing: Icon(Icons.keyboard_arrow_right),
              title: Text('记录'),
              onTap: (){
                Toast.show('点击了记录', context,gravity: Toast.TOP);
              },
              onLongPress: (){
                Toast.show('长按了记录', context,gravity: Toast.TOP);
              },
            ),
          ),
        ],
      ),
    );
  }
}