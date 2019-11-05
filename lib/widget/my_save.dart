import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySave extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MySave();
}

class _MySave extends State<MySave>{

  TextEditingController controller1 = new TextEditingController();
  String str2 = "";

  @override
  void initState() {
    super.initState();
    _shareData();
  }

  _shareData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if(preferences.getString('str1').isNotEmpty){
      setState(() {
        controller1.text = preferences.getString('str1');
      });
    }
  }

  _saveStr1(String str) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('str1', str);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('SharedPreference、文件读写'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[

            TextField(
              controller: controller1,
            ),
            Container(
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(onPressed:(){
                      _shareData();
                    },child: Text('读取'),),
                    RaisedButton(onPressed:(){
                      _saveStr1(controller1.text.toString());
                    },child: Text('保存'),),
                  ],
                )
            ),



          ],
        ),
      )
    );
  }
}