import 'package:flutter/material.dart';

class MyDialog extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyDialog();
}

class _MyDialog  extends State<MyDialog>{

  void click1(){
    showAboutDialog(
        context: context,
        applicationName: 'Flutter Study',
        applicationVersion: 'v1.0',
        applicationIcon: Icon(Icons.cloud_upload),
        children: [
          Text('1、优化视频通话；'),
          Text('2、加快APP启动；'),
          Text('3、新增充值功能。'),
        ]
    );
  }

  void click2(){
    showDialog(context: context,barrierDismissible: true,builder: (context){
      return AlertDialog(
        title: Text('标题'),
        content: Text('这里填写内容。'),
        backgroundColor: Colors.white,
        elevation: 20,
        semanticLabel: 'this is a dialog',
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        actions: <Widget>[
          FlatButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text('Yes')),

          FlatButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text('No')),
        ],
      );
    });
  }

  void click3(){
    showDialog(context: context,barrierDismissible: true,builder: (context){
      return SimpleDialog(
        title: Text('选择地点：'),
        children: <Widget>[
          SimpleDialogOption(
            child: Text('上海'),
            onPressed: (){
              Navigator.pop(context);
            },
          ),

          SimpleDialogOption(
            child: Text('北京'),
            onPressed: (){
              Navigator.pop(context);
            },
          ),

          SimpleDialogOption(
            child: Text('深圳'),
            onPressed: (){
              Navigator.pop(context);
            },
          ),

          SimpleDialogOption(
            child: Text('广州'),
            onPressed: (){
              Navigator.pop(context);
            },
          )
        ],
      );
    });
  }

  void click4(){
    showModalBottomSheet(context: context, builder: (context){
      return Container(
        height: 250,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: double.maxFinite,
            child: RaisedButton(onPressed:(){
              Navigator.pop(context,'按钮1');
            },child: Text('按钮1'),),
          ),

          Container(
            width: double.maxFinite,
            child: RaisedButton(onPressed:(){
              Navigator.pop(context,'按钮2');
            },child: Text('按钮2'),),
          ),

          Container(
            width: double.maxFinite,
            child: RaisedButton(onPressed:(){
              Navigator.pop(context,'按钮3');
            },child: Text('按钮2'),),
          ),

          Container(
            width: double.maxFinite,
            child: RaisedButton(onPressed:(){
              Navigator.pop(context,'按钮4');
            },child: Text('按钮4'),),
          ),

        ],
      ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog'),
      ),
      body: Column(
        children: <Widget>[
          Container(
              width: double.maxFinite,
              child: RaisedButton(onPressed:(){
                click1();
              },child: Text('AboutDialog'),)
          ),

          Container(
              width: double.maxFinite,
              child: RaisedButton(onPressed:(){
                click2();
              },child: Text('AlertDialog'),)
          ),

          Container(
              width: double.maxFinite,
              child: RaisedButton(onPressed:(){
                click3();
              },child: Text('SimpleDialog'),)
          ),

          Container(
              width: double.maxFinite,
              child: RaisedButton(onPressed:(){
                click4();
              },child: Text('BottomSheet'),)
          ),
        ],
      ),
    );
  }
}