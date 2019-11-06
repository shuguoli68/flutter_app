import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class TextStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/text.txt');
  }

  Future<String> readFile() async {
    try {
      final file = await _localFile;

      String content = await file.readAsString();
      return content;
    } catch (e) {
      return '';
    }
  }

  Future<File> writeFile(String text) async {
    final file = await _localFile;
    return file.writeAsString('$text\r\n', mode: FileMode.append);
  }

  Future<File> cleanFile() async {
    final file = await _localFile;
    return file.writeAsString('');
  }
}

class MySave extends StatefulWidget{

  final TextStorage storage;

  MySave({Key key, @required this.storage}):super(key:key);

  @override
  State<StatefulWidget> createState() => _MySave();
}

class _MySave extends State<MySave>{

  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  String str2 = "";

  @override
  void initState() {
    super.initState();
    _shareData();
    widget.storage.readFile().then((String str){
      controller2.text = str;
    });
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

            Text('SharedPreference的读写：'),
            TextField(
              controller: controller1,
              maxLines: 6,
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

            Padding(padding: EdgeInsets.all(30.0)),

            Padding(padding: EdgeInsets.only(top: 20.0),child: Text('文件的读写：'),),
            TextField(
              controller: controller2,
              maxLines: 6,
            ),
            Container(
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(onPressed:(){
                      widget.storage.readFile().then((String str){
                        setState(() {
                          controller2.text = str;
                        });
                      });
                    },child: Text('读取'),),
                    RaisedButton(onPressed:(){
                      widget.storage.writeFile(controller2.text.toString());
                    },child: Text('保存'),),
                    RaisedButton(onPressed:(){
                      widget.storage.cleanFile();
                      controller2.text = '';
                    },child: Text('清空'),),
                  ],
                )
            ),

          ],
        ),
      )
    );
  }
}